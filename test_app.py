from flask import Flask
from flask_testing import TestCase
from app import create_app, db
from app.models import Bucket

import app
import config
import unittest

class BaseTestCase(TestCase):

    # SQLALCHEMY_DATABASE_URI = 'postgresql://jhonny:depp@localhost/emailbucket_test'
    # TESTING = True
    app = Flask(__name__)
    app.config['TESTING'] = True

    def create_app(self):
        # app = config('config.TestingConfig')
        return app

    def setUp(self):
        db.create_all()

    def tearDown(self):
        db.session.remove()
        db.drop_all()


class FlaskTestCase(BaseTestCase):

    # # Ensure that Flask was set up correctly
    def test_index(self):
        self.assertEqual("Oke deh", 200)

    # def test_index(self):
    #     response = self.client.get('/', content_type='application/json')
    #     self.assertEqual(response.status_code, 200)

    # Ensure that main page requires user login
    # def test_main_route_requires_login(self):
    #     response = self.client.get('/', follow_redirects=True)
    #     self.assertIn(b'Please log in to access this page', response.data)

    # Ensure that welcome page loads
    # def test_welcome_route_works_as_expected(self):
    #     response = self.client.get('/welcome', follow_redirects=True)
    #     self.assertIn(b'Welcome to Flask!', response.data)

    # Ensure that posts show up on the main page
    # def testing_the_post(self):
    #     response = self.client.post(
    #         '/save_emails',
    #         data=dict(email_subject="subject test", email_content="this is email content text"),
    #         follow_redirects=True
    #     )
    #     self.assertIn(b'This is a test. Only a test.', response.data)


if __name__ == '__main__':
    unittest.main()
