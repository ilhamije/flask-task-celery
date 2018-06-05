import arrow

from datetime import datetime
from flask_sqlalchemy import SQLAlchemy

db = SQLAlchemy()

utc = arrow.utcnow()
local_sg = utc.to('Asia/Singapore').format('DD MMM YYYY hh:mm')


class Bucket(db.Model):
    event_id = db.Column(db.Integer, primary_key=True)
    email_subject = db.Column(db.String)
    email_content = db.Column(db.String)
    timestamp = db.Column(db.String)

    def __init__(self, email_subject, email_content):
        self.email_subject = email_subject
        self.email_content = email_content
        self.timestamp = unicode(local_sg)

    def save(self):
        db.session.add(self)
        db.session.commit()
