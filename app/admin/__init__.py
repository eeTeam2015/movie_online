#coding:utf8
__author__ = 'xojisi'

from flask import Blueprint

admin = Blueprint("admin", __name__)

import app.admin.views