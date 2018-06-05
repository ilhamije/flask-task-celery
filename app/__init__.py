import os

from flask import Flask, request, redirect, jsonify
from flask_migrate import Migrate

from config import app_config
from models import db, Bucket
from mymarsh import ma, BucketSchema


def create_app(config_name):
    app = Flask(__name__)
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
        return buckets_schema.jsonify(buckets)

    @app.route('/save_emails', methods=['POST'])
    def add_bucket():
        event_id         = request.json['event_id']
        email_subject 	 = request.json['email_subject']
        email_content 	 = request.json['email_content']
        timestamp 	     = request.json['timestamp']

        new_bucket = Bucket(
            event_id=event_id,
            email_subject=email_subject,
            email_content=email_content,
            timestamp=timestamp
            )
        new_bucket.save()
        return bucket_schema.jsonify(new_bucket), 201

    return app
