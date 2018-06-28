import os

from dateutil.parser import parse
from datetime import datetime, timedelta

from flask import Flask, request, Response, redirect, jsonify, flash
from flask_migrate import Migrate
from sqlalchemy.exc import IntegrityError
# from flask_mail import Mail

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
celery.conf.update(
    app.config,
    # BROKER_TRANSPORT_OPTIONS={
    #     'visibility_timeout': 86400
    # },  # 1 day
)

# mail = Mail(app)

ma.init_app(app)

bucket_schema = BucketSchema()
buckets_schema = BucketSchema(many=True)

emailaddress_schema = EmailAddressSchema()
emailaddresses_schema = EmailAddressSchema(many=True)


@celery.task
def execute_email(eventid):
    """Background task to execute email."""
    with app.app_context():
        # email = db.session.query(Bucket).filter_by(event_id=eventid).first()
        # print ('Executing this email with eventid: %s' % eventid)
        temp = str(datetime.now())
        print(temp)
        ret = str(eventid)
        return "event id: " + ret


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
                event_id=eventid,
                email_subject=emailsubject,
                email_content=emailcontent,
                timestamp=timestamp
            )
            new_bucket.save()

            # async task
            process_time_utc = parse(timestamp) - timedelta(hours=8)
            execute_email.apply_async(args=[eventid], eta=process_time_utc)

            return bucket_schema.jsonify(new_bucket), 201

        except IntegrityError as e:
            db.session.rollback()
            return jsonify({'Message': e.message})

    return app
