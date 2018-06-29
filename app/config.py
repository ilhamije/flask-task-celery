import os


class Config(object):
    DEBUG = False
    TESTING = False
    CSRF_ENABLED = True

class ProductionConfig(Config):
    DEBUG = False

class StagingConfig(Config):
    DEVELOPMENT = True
    DEBUG = True

class DevelopmentConfig(Config):
    SQLALCHEMY_DATABASE_URI = 'postgresql://jhonny:depp@localhost/emailbucket'
    SQLALCHEMY_TRACK_MODIFICATIONS = True
    DEVELOPMENT = True
    DEBUG = True

    # Celery configuration
    CELERY_BROKER_URL = 'redis://localhost:6379'
    CELERY_RESULT_BACKEND = 'redis://localhost:6379'

    # mail configuration
    # Flask-Mail configuration


class TestingConfig(Config):
    TESTING = True
    # SQLALCHEMY_DATABASE_URI = 'postgresql://jhonny:depp@localhost/emailbucket_test'
    DEBUG = True

app_config = {
    'development': DevelopmentConfig,
    'testing': TestingConfig,
    'staging': StagingConfig,
    'production': ProductionConfig,
}
