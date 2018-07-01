import arrow

from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

utc = arrow.utcnow()
local_sg = utc.to('Asia/Singapore').format('DD MMM YYYY hh:mm')


class Bucket(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    event_id = db.Column(db.Integer, nullable=False)
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

    def __repr__(self):
        return '<Bucket {}>'.format(self.event_id)


class EmailAddress(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    email = db.Column(db.String(120), nullable=False)
    event_id = db.Column(db.Integer)

    def __init__(self, email, event_id):
        self.email = str(email)
        self.event_id = event_id

    def save(self):
        db.session.add(self)
        db.session.commit()

    @staticmethod
    def get_all():
        return EmailAddress.query.all()

    def get_by(eventid):
        result = EmailAddress.query.filter_by(event_id=eventid).all()
        return result

    def delete(self):
        db.session.delete(self)
        db.session.commit()

    def __repr__(self):
        return '{}'.format(self.email)
