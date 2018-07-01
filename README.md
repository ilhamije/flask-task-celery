# Flask Task Celery

This is simple project with Flask.
With Celery help, it will handle POST methods and execute email based on certain timestamp.

#### Environment
`export APP_SETTINGS='development'`

### Set App to run
`export FLASK_RUN=run.py`

#### DB Initialize
`$ flask db init --directory app/migrations`
#### DB migrate
`$ flask db migrate --directory app/migrations`
#### DB upgrade
`$ flask db upgrade --directory app/migrations`

#### Change your Email config
Go to app/config.py change these:
- MAIL_USERNAME
- MAIL_PASSWORD
- MAIL_DEFAULT_SENDER

#### Start redis server
`$ ./run-redis.sh`

#### Start celery task
`../venv/bin/celery worker -A app.celery --loglevel=info`

#### Deployment
`$ flask run`

#### example POST request with postman
- timestamp in Singapore time
{
	"event_id": "41",
	"email_subject": "Discount of the month, just for you.",
	"email_content": "It's a body content. Just for a test. It's a body content. Just for a test.",
	"timestamp": "28 Jun 2018 10:22"
}

#### Some insight
The purpose of this project is to save four parameters ( event_id, email_subject, email_content, timestamp ) to database. After data saved into database, it create a celery task that will be executed later based on timestamp ( ex : Singapore time ). If there is at least an email address. The task will sent it when the time is hit.
