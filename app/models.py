import arrow

from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

utc = arrow.utcnow()
local_sg = utc.to('Asia/Singapore').format('DD MMM YYYY hh:mm')


class Bucket(db.Model):
    id = db.Column(db.Integer, primary_key=True)
    event_id = db.Column(db.Integer, unique=True)
    email_subject = db.Column(db.String)
    email_content = db.Column(db.String)
    timestamp = db.Column(db.String)
    created_date = db.Column(db.DateTime, default=datetime.utcnow)

    def __init__(self, event_id, email_subject, email_content, timestamp):
        self.event_id = event_id
        self.email_subject = email_subject
        self.email_content = email_content
        self.timestamp = timestamp #unicode(local_sg)

    def save(self):
        db.session.add(self)
        db.session.commit()
