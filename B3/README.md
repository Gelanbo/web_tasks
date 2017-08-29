数据表结构
====
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

