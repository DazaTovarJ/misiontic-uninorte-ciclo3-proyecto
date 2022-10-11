import os

class Config:
    DEBUG = True
    TESTING = True

    # Configuración Base de Datos
    MYSQL_HOST = os.environ.get("DB_HOST")
    MYSQL_USER = os.environ.get("DB_USER")
    MYSQL_PASSWORD = os.environ.get("DB_PASSWORD")
    MYSQL_DB = os.environ.get("DB_SCHEMA")

class ProductionConfig(Config):
    DEBUG = False

class DevelopmentConfig(Config):
    SECRET_KEY = 'dev'
    DEBUG = True
    TESTING = True