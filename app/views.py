from app import app
import os, json

from dateutil.parser import parse
from datetime import datetime, timedelta

from flask import Flask, request, Response, redirect, jsonify, flash
from flask_migrate import Migrate
from flask_mail import Message, Mail
from sqlalchemy.exc import IntegrityError

from config import app_config
from models import db, Bucket, EmailAddress
from mymarsh import ma, BucketSchema, EmailAddressSchema
from celery import Celery


mail = Mail(app)

celery = Celery(app.name, broker=app.config['CELERY_BROKER_URL'])
celery.conf.update(app.config)

ma.init_app(app)
bucket_schema = BucketSchema()
emailaddress_schema = EmailAddressSchema()
emailaddresses_schema = EmailAddressSchema(many=True)

@celery.task
def execute_email(toemail,eventid,emailsubject,emailcontent):
    """Background task to execute email."""
    sender = app.config['MAIL_DEFAULT_SENDER']
    subject = str(emailsubject) + " | " + str(eventid)
    msg = Message(subject, sender=sender, recipients=[toemail])
    msg.body = emailcontent

    with app.app_context():
        mail.send(msg)
        return "Email sent! "


def create_app(config_name):
    # app.config.from_object('config')
    app.config.from_object(app_config[config_name])

    db.init_app(app)
    migrate = Migrate(app, db)


    @app.route('/')
    def index():
        return jsonify({'Message': "This is not the droid you are looking for."})

    @app.route('/email_list', methods=['GET', 'POST'])
    def email_list():
        # GET
        if request.method == 'POST':
            email           = request.json['email']
            eventid         = request.json['event_id']
            new_emaillist   = EmailAddress(
                email       = email,
                event_id    = eventid
            )
            new_emaillist.save()
            return emailaddress_schema.jsonify(new_emaillist), 201
        else:
            emaillists = EmailAddress.get_all()
            result = emailaddresses_schema.dump(emaillists)
            return jsonify(result.data)


    @app.route('/save_emails', methods=['POST'])
    def add_bucket():
        try:
            eventid          = request.json['event_id']
            emailsubject 	 = request.json['email_subject']
            emailcontent 	 = request.json['email_content']
            timestamp 	     = request.json['timestamp']

            new_bucket = Bucket(
                event_id = eventid,
                email_subject = emailsubject,
                email_content = emailcontent,
                timestamp = timestamp
            )
            new_bucket.save()

            process_time_utc = parse(timestamp) - timedelta(hours=8)
            print "process_time_utc: " + str(process_time_utc)

            emailrecipients = EmailAddress.query.filter_by(event_id=eventid).all()
            if len(emailrecipients) > 0:
                for toemail in emailrecipients:
                    toemail = str(toemail)
                    execute_email.apply_async(
                        args=[toemail,eventid,emailsubject,emailcontent,],
                        eta=process_time_utc)
                taskmsg = "Task added."
            else:
                taskmsg = "Email address of eventid:%s is not exist." % eventid

            print taskmsg
            return bucket_schema.jsonify(new_bucket), 201

        except IntegrityError as e:
            db.session.rollback()
            return jsonify({'Message': e.message})

    return app
