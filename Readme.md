基于Flask框架开发的微电影网站

功能介绍：
【前台】
会员登录及注册 / 会员中心 / 电影播放 / 电影评论 / 电影收藏
【后台】
管理员登录 / 修改密码 / 标签管理 /
电影管理 / 上映预告管理 / 会员管理/
评论管理 / 收藏管理 / 角色管理 /
权限管理 / 管理员管理 / 日志管理

启动步骤：
1. 安装python依赖包
2. 新建一个数据库
1. 在app/__init __.py里的 app.config["SQLALCHEMY_DATABASE_URI"] 设置数据库链接
1. 单独运行app/models.py，自动创建数据表
1. 使用data.sql导入基础数据

备注1：如使用data.sql导入。管理员帐号：admin 密码：admin123
备注2：默认使用jwplayer,如想使用Dplayer，请先安装Redis（因为加了弹幕功能），并在app/templates/home/index.html, 将

```
<a href="{{ url_for('home.play',id=v.id,page=1) }}" class="btn btn-primary" target="_blank" role="button"><span class="glyphicon glyphicon-play"></span>  播放</a>
```
改为
```
<a href="{{ url_for('home.video',id=v.id,page=1) }}" class="btn btn-primary" target="_blank" role="button"><span class="glyphicon glyphicon-play"></span>  播放</a>
```
