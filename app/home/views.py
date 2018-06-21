#coding:utf8
__author__ = 'xojisi'
from . import home
from flask import render_template, redirect, url_for

# 首页
@home.route("/")
def index():
    # return "<h1 style='color:green'>this is home<h1/>"
    return render_template("home/index.html")

# 登录
@home.route("/login/")
def login():
    return render_template("home/login.html")

# 退出
@home.route("/logout/")
def logout():
    return redirect(url_for('home.login'))

# 注册
@home.route("/regist/")
def regist():
    return render_template("home/regist.html")

@home.route("/user/")
def user():
    return render_template("home/user.html")

@home.route("/pwd/")
def pwd():
    return render_template("home/pwd.html")

@home.route("/comments/")
def comments():
    return render_template("home/comments.html")

@home.route("/loginlog/")
def loginlog():
    return render_template("home/loginlog.html")

@home.route("/moviecol/")
def moviecol():
    return render_template("home/moviecol.html")