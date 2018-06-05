"""empty message

Revision ID: afc17559dc58
Revises: ac5a86f7f6d7
Create Date: 2018-06-05 13:14:49.372702

"""
from alembic import op
import sqlalchemy as sa


# revision identifiers, used by Alembic.
revision = 'afc17559dc58'
down_revision = 'ac5a86f7f6d7'
branch_labels = None
depends_on = None


def upgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.add_column('bucket', sa.Column('id', sa.Integer(), nullable=False))
    op.alter_column('bucket', 'event_id',
               existing_type=sa.INTEGER(),
               nullable=True)
    # ### end Alembic commands ###


def downgrade():
    # ### commands auto generated by Alembic - please adjust! ###
    op.alter_column('bucket', 'event_id',
               existing_type=sa.INTEGER(),
               nullable=False)
    op.drop_column('bucket', 'id')
    # ### end Alembic commands ###