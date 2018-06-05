"""empty message

Revision ID: dd44b8e442ab
Revises: 4b3ad0b4439a
Create Date: 2018-06-05 13:39:04.503523

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'dd44b8e442ab'
down_revision = '4b3ad0b4439a'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('bucket', 'event_id',
               existing_type=sa.INTEGER(),
               nullable=True)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('bucket', 'event_id',
               existing_type=sa.INTEGER(),
               nullable=False)
    # ### end Alembic commands ###
