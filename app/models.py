import arrow

from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

utc = arrow.utcnow()
local_sg = utc.to('Asia/Singapore').format('DD MMM YYYY hh:mm')


class Bucket(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    event_id = db.Column(db.Integer, unique=True, nullable=False)
    email_subject = db.Column(db.String, nullable=False)
    email_content = db.Column(db.String, nullable=False)
    timestamp = db.Column(db.String, nullable=False)
    created_date = db.Column(db.DateTime, default=datetime.utcnow)

    def __init__(self, event_id, email_subject, email_content, timestamp):
        self.event_id = event_id
        self.email_subject = email_subject
        self.email_content = email_content
        self.timestamp = timestamp #unicode(local_sg)

    def save(self):
        db.session.add(self)
        db.session.commit()

class EmailAddress(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), nullable=False)
    bucket_event_id = db.Column(db.Integer, db.ForeignKey('bucket.event_id'), nullable=True)

    def __init__(self, email):
        self.email = email

    def save(self):
        db.session.add(self)
        db.session.commit()

    @staticmethod
    def get_all():
        return EmailAddress.query.all()

    def __repr__(self):
        return "<Bucketlist: {}>".format(self.name)
