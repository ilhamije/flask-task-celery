from datetime import datetime

from flask import Flask, jsonify
from flask_sqlalchemy import SQLAlchemy
from celery_flask import make_celery

app = Flask(__name__)
app.config['SECRET_KEY'] = 'top-secret!'
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://jhonny:depp@localhost/emailbucket'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = True

# Celery configuration
app.config['CELERY_BROKER_URL'] = 'redis://localhost:6379'
app.config['CELERY_RESULT_BACKEND'] = 'redis://localhost:6379'

db = SQLAlchemy(app)
celery = make_celery(app)
# celery.conf.update(app.config)

# class Bucket(db.Model):
#     id = db.Column(db.Integer, primary_key=True)
#     event_id = db.Column(db.Integer, nullable=False)
#     email_subject = db.Column(db.String, nullable=False)
#     email_content = db.Column(db.String, nullable=False)
#     timestamp = db.Column(db.String, nullable=False)
#     created_date = db.Column(db.DateTime, default=datetime.utcnow)


@celery.task
def background_process():
    # chk = check_timestamp()
    # dtm = datetime.utcnow
    return jsonify({
        'Process':'Executing email '
        })

def check_timestamp():
    email_timestamp = Bucket.query.filter(timestamp).first()
    pass

if __name__ == '__main__':
    app.run(debug=True)
