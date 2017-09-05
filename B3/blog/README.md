<<<<<<< HEAD
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
=======
数据表结构与程序说明
=====
# 数据表结构

## 文章表（posts）

字段名|类型|描述
:----:|:----:|:---:
id        |integer|主键
title     |string |文章标题
content   |string |文章内容
admin_id  |integer|关联管理员
created_at|date   |创建日期
updated_at|date   |更新日期

## 留言表（comments）

字段名|类型|描述
:----:|:----:|:---:
id        |integer|主键
content   |string |留言内容
post_id   |integer|关联文章
created_at|date   |创建日期
pass      |bool   |是否通过管理员管理

## 反馈表（feedbacks）

字段名|类型|描述
:----:|:----:|:---:
id        |integer|主键
context   |string |反馈内容
created_at|date   |创建日期
author    |string |反馈者

## 管理员账户表（admins）

字段名|类型|描述
:----:|:----:|:---:
id        |integer |主键
adminname |string  |管理员账号
password  |string  |管理员密码 
<br>

程序说明：
====
## 当前进度与已完成<br>
建立相关数据表与模型（参照上面的数据表）；<br>
前台与后台程序均已开发完毕，主功能正常；<br><br>
说明：根路由设置“管理员登录”与“游客访问”按钮，点击后进入对应的后台与前台管理；<br><br>
后台说明：<br>
1.由于未对管理员账户进行管理，所以默认可以成功登录的管理员账户和密码为Admin表的第一条记录；登录次数超过三次时锁定账户，10分钟后才能再次尝试登陆；
登录后显示三大板块的链接；<br>
3.进入文章管理，显示文章列表，并设置了对应的按钮，可以对文章实现增删查改操作；<br>
4.进入留言管理，可以显示当前还未审核通过的留言列表，点击通过后可在对应文章的下方看到留言（需要先在前台中由游客发表留言，后台才可以管理）；<br>
5.进入反馈管理，可以看到游客提交的反馈列表；<br>
6.后台相关页面中会有登录状态的判断，未登录状态时跳转回登录页面。<br><br>
前台说明：<br>
1.游客无需登录即可看到文章列表，可以查看文章，按时间分类查看文章以及根据标题搜索文章，但是不能对文章实现增删查改操作；<br>
2.进入对应的文章显示页面，下方会显示已经被后台审核通过的留言列表，以及可以通过添加留言按钮实现留言提交。提交的留言可以由后台管理员进行审核，通过后才可以显示在对应文章下方；<br>
3.首页还添加了意见反馈表单，提交后，后台管理员可看到。<br>
## 截止8.29 暂未完成：<br>
1.validate实现各项数据验证；<br>
2.加分项除搜索以外的其他内容；<br>
3.代码规整（如使用布局和局部视图简化代码，rails编程风格等）。
>>>>>>> b14f37af42504fc5283f73d2b8402b128012480c
