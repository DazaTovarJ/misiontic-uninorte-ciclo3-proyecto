import pymysql
import os

host = os.environ.get("DB_HOST")
user = os.environ.get("DB_USER")
password = os.environ.get("DB_PASSWORD", "")
db = os.environ.get("DB_SCHEMA")


def get_connection():
    return pymysql.connect(host=host, user=user, password=password, db=db)
