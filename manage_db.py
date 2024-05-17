from sqlalchemy import create_engine, Column, Integer, String, Date
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import sessionmaker

Base = declarative_base()

engine_user = create_engine('mysql+pymysql://user:user_password@localhost:3308/user_db')
SessionUser = sessionmaker(bind=engine_user)
session_user = SessionUser()

engine_user_extra = create_engine('mysql+pymysql://user_extra:user_extra_password@localhost:3307/user_extra_db')
SessionUserExtra = sessionmaker(bind=engine_user_extra)
session_user_extra = SessionUserExtra()

class User(Base):
    __tablename__ = 'users'
    id = Column(Integer, primary_key=True)
    username = Column(String(50), nullable=False)
    email = Column(String(100), nullable=False)

class UserExtra(Base):
    __tablename__ = 'user_extras'
    user_id = Column(Integer, primary_key=True)
    favorite_hobby = Column(String(100))
    account_creation_date = Column(Date)

def add_user_extra(user_id, hobby, creation_date):
    user = session_user.query(User).filter_by(id=user_id).first()
    if user:
        existing_entry = session_user_extra.query(UserExtra).filter_by(user_id=user_id).first()
        if existing_entry:
            print(f'Entry for user {user_id} already exists in user_extras')
        else:
            new_user_extra = UserExtra(user_id=user_id, favorite_hobby=hobby, account_creation_date=creation_date)
            session_user_extra.add(new_user_extra)
            session_user_extra.commit()
            print(f'Added extra info for user {user_id}')
    else:
        print(f'User {user_id} does not exist in users')

add_user_extra(1, 'coding', '2024-05-14')
