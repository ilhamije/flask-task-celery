import os

from dateutil.parser import parse
from datetime import datetime, timedelta

from flask import Flask, request, Response, redirect, jsonify, flash
from flask_migrate import Migrate
from sqlalchemy.exc import IntegrityError
from flask_mail import Message, Mail

from config import app_config
from models import db, Bucket, EmailAddress
from mymarsh import ma, BucketSchema, EmailAddressSchema
from celery import Celery


app = Flask(__name__)

# Initialize Celery
app.config['SECRET_KEY'] = 'ini-rahasia'
app.config['CELERY_BROKER_URL'] = 'redis://localhost:6379'
app.config['CELERY_RESULT_BACKEND'] = 'redis://localhost:6379'

celery = Celery(app.name, broker=app.config['CELERY_BROKER_URL'])
celery.conf.update(app.config)


ma.init_app(app)
mail = Mail(app)

bucket_schema = BucketSchema()
buckets_schema = BucketSchema(many=True)

emailaddress_schema = EmailAddressSchema()
emailaddresses_schema = EmailAddressSchema(many=True)


@celery.task
def execute_email(msg):
    """Background task to execute email."""
    with app.app_context():
        # email = db.session.query(Bucket).filter_by(event_id=eventid).first()
        # print ('Executing this email with eventid: %s' % eventid)
        temp = str(datetime.now())
        print(temp)
        ret = str(msg)
        return "msg: " + ret


def create_app(config_name):
    app.config.from_object('config')
    app.config.from_object(app_config[config_name])

    db.init_app(app)
    migrate = Migrate(app, db)

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

            msg = ('hey apa kabar?')

            # async task
            process_time_utc = parse(timestamp) - timedelta(hours=8)
            execute_email.apply_async(
                args=[msg],
                eta=process_time_utc)

            return bucket_schema.jsonify(new_bucket), 201

        except IntegrityError as e:
            db.session.rollback()
            return jsonify({'Message': e.message})


    @app.route('/emaillists/', methods=['GET','POST'])
    def emaillist():
        if request.method == 'POST':
            # email          = request.json['email']
            # # if name:
            email           = request.json['email']
            bucket_event_id = request.json['bucket_event_id']

            new_email = EmailAddress(
                email           = email,
                bucket_event_id = bucket_event_id
            )
            print new_email
            # new_email.save()
            # return emailaddress_schema.jsonify(new_bucket), 201

        else:
            # GET
            emaillists = EmailAddress.get_all()
            # results = []

            # for emaillist in emaillists:
            #     obj = {
            #         'id': emaillist.id,
            #         'email': emaillist.email,
            #         'bucket_event_id': emaillist.bucket_event_id
            #     }
            #     results.append(obj)
            #
            # response = jsonify(results)
            # response.status_code = 201

            return emailaddresses_schema.jsonify(emaillists), 201

    return app
