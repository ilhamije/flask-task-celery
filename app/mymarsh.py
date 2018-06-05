from flask_marshmallow import Marshmallow

ma = Marshmallow()

class BucketSchema(ma.Schema):
    class Meta:
        fields = ('event_id','email_subject','email_content','timestamp')
