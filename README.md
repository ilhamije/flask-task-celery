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

#### Start redis server
`$ ./run-redis.sh`

#### Start celery task
`../venv/bin/celery worker -A app.celery --loglevel=info`

#### Deployment
`$ flask run`

#### example POST request with postman
{
	"event_id": "41",
	"email_subject": "Discount of the month, just for you.",
	"email_content": "It's a body content. Just for a test. It's a body content. Just for a test.",
	"timestamp": "28 Jun 2018 10:22"
}
