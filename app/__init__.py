import os

from dateutil.parser import parse
from datetime import datetime, timedelta

from flask import Flask, request, redirect, jsonify, flash
from flask_migrate import Migrate

from config import app_config
from models import db, Bucket
from mymarsh import ma, BucketSchema
from celery import Celery



app = Flask(__name__)

# Initialize Celery
app.config['SECRET_KEY'] = 'ini-rahasia'
app.config['CELERY_BROKER_URL'] = 'redis://localhost:6379'
app.config['CELERY_RESULT_BACKEND'] = 'redis://localhost:6379'
celery = Celery(app.name, broker=app.config['CELERY_BROKER_URL'])
celery.conf.update(app.config)

@celery.task
def execute_email(msg):
    """Background task to execute email."""
    print msg + ' Yes!'


def create_app(config_name):
    app.config.from_object('config')
    app.config.from_object(app_config[config_name])

    db.init_app(app)
    ma.init_app(app)

    bucket_schema = BucketSchema()
    buckets_schema = BucketSchema(many=True)

    migrate = Migrate(app, db)


    @app.route('/', methods=['GET'])
    def index():
        buckets = db.session.query(Bucket).all()
        msg = 'This email will be executed.'
        execute_email.delay(msg)
        flash('Sending email..')

        ts_string = db.session.query(Bucket.timestamp).first()
        ts_strings = db.session.query(Bucket.timestamp).all()
        ts_utc = parse(ts_string[0]) - timedelta(hours=8)
        for d in ts_strings:
            ts_utc = parse(d[0]) - timedelta(hours=8)
            ts_now = datetime.utcnow()
            if ts_now > ts_utc:
                msg = 'Did it work?'
                execute_email(msg)



        return buckets_schema.jsonify(buckets)


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

            return bucket_schema.jsonify(new_bucket), 201

        except KeyError as e:
            return jsonify({
                'Description':'Bad request',
                'Error':400,
                'Message':'Please fix this field: '+unicode(e)
                }), 400


    return app
