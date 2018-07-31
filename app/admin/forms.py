#coding:utf8
__author__ = 'xojisi'

from flask_wtf import FlaskForm
from wtforms import StringField, PasswordField, SubmitField, FileField
from wtforms import TextAreaField, SelectField
from wtforms.validators import DataRequired, ValidationError
from app.models import Admin, Tag

tags = Tag.query.all()

class LoginForm(FlaskForm):
    """管理员登录表单"""
    account = StringField(
        label = "帐号",
        validators = [DataRequired("请输入帐号!")],
        description = "帐号",
        render_kw = {
            "class" : "form-control",
            "placeholder" : "请输入帐号!",
            # "required" : "required"
        }
    )
    pwd = PasswordField(
        label = "密码",
        validators = [DataRequired("请输入密码!")],
        description = "密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入密码!",
            # "required": "required"
        }
    )
    submit = SubmitField(
        "登录",
        render_kw={
            "class": "btn btn-primary btn-block btn-flat",
        }
    )

    def validate_account(self, field):
        account = field.date
        admin = Admin.query.filter_by(name=account).count()
        if admin == 0:
            raise ValidationError("帐号不存在")

class TagForm(FlaskForm):
    name = StringField(
        laber = "名称",
        validators = [DataRequired("请输入标签！")],
        description = "标签",
        render_kw={
            "class": "form-control",
            "id": "input_name",
            "placeholder": "请输入标签名称！"
        }
    )
    submit = SubmitField(
        "编辑",
        render_kw={
            "class": "btn btn-primary",
        }
    )

class MovieForm(FlaskForm):
    title = StringField(
        laber="片名",
        validators=[DataRequired("请输入片名！")],
        description="片名",
        render_kw={
            "class": "form-control",
            "id": "input_title",
            "placeholder": "请输入片名！"
        }
    )
    url = FileField(
        laber="文件",
        validators=[DataRequired("请上传文件！")],
        description="文件",
    )
    info = TextAreaField(
        laber="简介",
        validators=[DataRequired("请输入简介！")],
        description="简介",
        render_kw={
            "class": "form-control",
            "rows" : 10
        }
    )
    logo = FileField(
        laber="封面",
        validators=[DataRequired("请上传封面！")],
        description="封面",
    )
    star = SelectField(
        laber="星级",
        validators=[DataRequired("请选择星级！")],
        coerce = int,
        choices = [(1,"1星"),(2,"2星"),(3,"3星"),(4,"4星"),(5,"5星")],
        description="星级",
        render_kw={
            "class": "form-control",
        }
    )
    tag_id = SelectField(
        laber="标签",
        validators=[DataRequired("请选择星级！")],
        coerce=int,
        choices=[(v.id, v.name) for v in tags],
        description="标签",
        render_kw={
            "class": "form-control",
        }
    )
    area = StringField(
        laber="地区",
        validators=[DataRequired("请输入地区！")],
        description="地区",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入地区！"
        }
    )
    length = StringField(
        laber="片长",
        validators=[DataRequired("请输入片长！")],
        description="片长",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入片长！"
        }
    )
    release_time = StringField(
        laber="上映时间",
        validators=[DataRequired("请选择上映时间！")],
        description="上映时间",
        render_kw={
            "class": "form-control",
            "placeholder": "请选择上映时间！",
            "id": "input_release_time"
        }
    )
    submit = SubmitField(
        "编辑",
        render_kw={
            "class": "btn btn-primary",
        }
    )

class PreviewForm(FlaskForm):
    title = StringField(
        laber="预告标题",
        validators=[DataRequired("请输入预告标题！")],
        description="预告标题",
        render_kw={
            "class": "form-control",
            "id": "input_title",
            "placeholder": "请输入预告标题！"
        }
    )
    logo = FileField(
        laber="预告封面",
        validators=[DataRequired("请上传预告封面！")],
        description="预告封面",
    )
    submit = SubmitField(
        "编辑",
        render_kw={
            "class": "btn btn-primary",
        }
    )

class PwdForm(FlaskForm):
    old_pwd = PasswordField(
        validators=[
            DataRequired("请输入旧密码！")
        ],
        description="旧密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入旧密码!",
        }
    )
    new_pwd = PasswordField(
        validators=[
            DataRequired("请输入新密码！")
        ],
        description="新密码",
        render_kw={
            "class": "form-control",
            "placeholder": "请输入新密码!",
        }
    )
    submit = SubmitField(
        "编辑",
        render_kw={
            "class": "btn btn-primary",
        }
    )

    def validate_old_pwd(self,field):
        from flask import session
        pwd = field.data
        name = session["admin"]
        admin = Admin.query.filter_by(
            name=name
        ).first()
        if not admin.check_pwd(pwd):
            raise ValidationError("旧密码错误！")
