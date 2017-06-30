# SHC小组：无微不至的借阅伴侣使用前必读
## 一、简介：<br>
声明：本项目（BBS）暨"Book Borrowing System"为SHC小组参加第六届“中国软件杯”竞赛时所做项目，请勿用作商业用途。本项目主要分为两个板块：
普通用户端（必须从微信客户端打开，否则会导致一些功能无法使用）以及管理员端（管理员端为响应式网页，可用电脑或微信端打开。微信端主要是为了扫描用户二维码）。
若想在线上体验我们的项目，请在微信公众号里搜索yxgz12或扫描下方的二维码关注我们的微信公众号来使用。
我们为您提供一个管理员帐号测试使用，用户帐号请您自行注册。
管理员帐号：admin  管理员密码：123
<br>
![扫描即可关注我们的微信公众号](https://github.com/starpxy/BBS/raw/master/WebContent/res/qrCode.jpg "扫码关注微信公众号") 
<br>
## 二、使用前的配置<br>
本项目基于微信公众平台开发。根据国家法律法规要求，使用此项目前请将项目部署到已备案过的网站上（注：解析网站的服务器也需备案）。
完成备案后，若要正常使用项目，需要以下几条配置：<br>
* 服务器配置：`Apache Tomcat6.0`以上版本（我们使用8.5）、`Java JDK 1.8.0`以上、`MySQL数据库`（需修改编码格式为UTF-8，否则会有编码错误）。由于微信接口的要求，需要修改Apache Tomcat的默认端口为`80`。
服务器的备案在这里不做解释，可以自行百度配置方式。注：若不备案，会导致网站无法访问！<br>
* 公众号配置：若要正常使用此项目的功能（如微信扫码，微信支付、发送模版消息以及其他微信接口），使用者需拥有`服务号`级别以上的公众号，
并开通微信支付功能（需要通过微信商户验证并缴纳一定金额）。在确保公众号拥有接口权限后，请打开项目的com/bbs/api文件夹下的BasicAccountParam.java文件，
修改里面对应的配置（注：其中的key参数是开通了微信支付的公众号独有的API Key，在微信商户平台上设置）。在公众号上还需要配置JS安全域名、支付目录等，
否则会导致JS接口无法调用。<br>
* 项目配置：将项目下载后，请打开`conf`文件夹下的`db.properties`来修改数据库配置（需修改用户名，密码）。由于本项目使用了
`Spring`、`Struts`、`Hibernate`三大框架，您无需导入数据库生成文件来创建数据表，只需要为项目创建一个数据库即可。命令如下：
```SQL
      CREATE DATABASE BBS;
```
## 三、项目的使用<br>
按照以上配置说明配置好项目的环境以后即可开始使用。项目的使用流程会在另一篇文档《使用流程》中介绍，此处将为大家介绍细节功能和模块。<br>
* 用户模块<br>
    * 登陆
    * 注册
    * 搜书
    * 评论
    * 预定
    * 借书
    * 付款（存在一些问题）          
    
