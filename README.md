# Flask Task Celery

This is an experimental project with Flask.
With Celery help, it will handle incoming emails thru POST request.

#### Environment and server
(dotenv not running)
`export APP_SETTINGS='development'`
`export FLASK_RUN=run.py`

#### DB Initialize
`$ flask db init`
#### DB migrate
`$ flask db migrate`
#### DB upgrade
`$ flask db upgrade`

#### Start redis server
`$ ./run-redis.sh`

#### Start celery task
`../venv/bin/celery worker -A app.celery --loglevel=info`

#### Deployment
`$ flask run`
