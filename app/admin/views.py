#coding:utf8
__author__ = 'xojisi'

from . import admin

@admin.route("/")
def index():
    return "<h1 style='color:red'>this is admin<h1/>"