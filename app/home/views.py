#coding:utf8
__author__ = 'xojisi'

from . import home

@home.route("/")
def index():
    return "<h1 style='color:green'>this is home<h1/>"