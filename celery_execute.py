from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from celery_flask import make_celery

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://jhonny:depp@localhost/emailbucket_celery'
app.config['CELERY_BROKER_URL'] = 'amqp://localhost/'

db = SQLAlchemy(app)
celery = make_celery(app)



if __name__ == '__main__':
    app.run(debug=True)
