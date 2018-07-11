#coding:utf8
__author__ = 'xojisi'

from flask import Flask, render_template
from flask_sqlalchemy import SQLAlchemy
import warnings
warnings.filterwarnings('ignore')
import pymysql

app = Flask(__name__)
app.config["SQLALCHEMY_DATABASE_URI"] = "mysql+pymysql://root:root@127.0.0.1:3306/movie_online?charset=utf8"
app.config["SQLALCHEMY_TRACK_MODIFICATIONS"] = True
app.config["SECRET_KEY"] = "d3a64eaea17946cd8c7f0d363390c6cb"
app.debug = True
db = SQLAlchemy(app)

from app.home import home as home_blueprint
from app.admin import admin as admin_blueprint

app.register_blueprint(home_blueprint)
app.register_blueprint(admin_blueprint, url_prefix="/admin")


# 404
@app.errorhandler(404)
def page_notr_found(error):
    return render_template("home/404.html"), 404