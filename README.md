# SHC小组：无微不至的借阅伴侣使用前必读
## 一、简介：<br>
声明：本项目（BBS）暨"Book Borrowing System"为SHC小组参加第六届“中国软件杯”竞赛时所做项目，请勿用作商业用途。本项目主要分为两个板块：
普通用户端（必须从微信客户端打开，否则会导致一些功能无法使用）以及管理员端（管理员端为响应式网页，可用电脑或微信端打开。微信端主要是为了扫描用户二维码）。
若想在线上体验我们的项目，请在微信公众号里搜索`yxgz12`或扫描下方的二维码关注我们的微信公众号来使用。
我们为您提供一个管理员帐号测试使用。用户帐号因涉及微信绑定，所以需要您自行注册，对此造成的麻烦我们深表歉意。
管理员帐号：admin  管理员密码：123456
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
<br>

## 三、项目的使用<br>
按照以上配置说明配置好项目的环境以后即可开始使用。项目的使用流程会在另一篇文档《使用流程》中介绍，此处将为大家介绍细节功能和模块。<br>
* 用户模块（线上）<br>
    * 登入：已注册用户可以在登陆界面通过输入手机号以及密码来登入。也可以直接点击页面下方微信logo标志方式，此方式为微信登录，通过用户认证后，可实现快捷登录。<br>![WechatIMG63](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG63.jpeg)
    * 登出：用户可以在主界面的“个人信息”目录下的“注销”来登出，也可以通过“个人信息”目录下的“我的个人信息”进行帐号切换。注：若想切换用户，一定要退出登陆！！！！！！ ![WechatIMG96](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG96.jpeg)
    * 注册：用户可以在登陆界面通过点击“注册帐号”来进行注册，注册时会采集用户的个人信息如身份证号、姓名、以及微信号。<br>![WechatIMG64](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG64.jpeg)
    * 搜书（推荐）：用户可以在主界面的搜索栏根据作者、书名、isbn码来进行模糊查询，系统会返回给用户一个包含相关书籍的图书列表。用户可以根据自己的需求点进查看书籍详情。若该用户有过历史搜索，系统会根据他的搜索习惯来为他推荐一系列书籍，并可以通过`换一批`按钮来更换推荐书籍，每次搜索结束后，推荐书籍列表就会更新。<br>![WechatIMG72](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG72.jpeg)![搜书结果](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG4685.jpg) 
    * 书籍详情（推荐）：在书籍详情页面，我们可以查看书籍的前言、评论、目录等信息。在书籍详情的最下方，会有系统根据此书为用户推荐的图书列表，若用户不满意，可点击`换一批`更换书籍<br> ![WechatIMG67](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG67.jpeg)![WechatIMG98](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG98.jpeg)
    * 评论：在书籍详情页面，我们可以为一本书评星、评论。管理员可以把你的评论加入精选。对于同一本书，用户的评论在被加入精选之前，不可以进行下一次评论。 <br>![WechatIMG97](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG97.jpeg)
    * 预定：在书籍详情页面，用户可以点击“预定”按钮来预定图书，同一个用户处在借阅状态的书籍数目上限为两本。当用户去图书馆借书时，他只能借阅自己预定的那一本书（我们的书籍具有特异性，每一本书都会在库存中有相应记录，即使是同一类书，也不尽相同）。用户也可以取消自己的预定书籍。当预定成功后，系统会在微信公众号内为用户自动推送一条预定成功的模板消息。<br> ![WechatIMG68](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG68.jpeg)![WechatIMG70](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG70.jpeg)
    * 扫码添加借书单：通过在主页点击借书栏目的“扫一扫借书”可以调起微信扫一扫功。我们可以扫描图书上贴的二维码（这个二维码在管理员端主页面可以查询到）来将书籍添加到自己的待确认借书单。在待确认借书单页面可以取消对于书籍的选择以及调起自己的借书二维码。![WechatIMG61](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG61.jpeg)![WechatIMG62](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG62.jpeg)
    * 用户账户二维码：借书二维码页面可以通过主页中的链接进入或通过确认借书单页面进入。在用户二维码界面会不断刷新二维码以及支付状态（用户也可点击二维码手动刷新，但若未到后台更新时间，刷新后的二维码保持不变），一旦检测到用户有未支付订单就回自动拉起微信支付功能`注：此功能为真正的微信支付功能，而不是我们模拟出的支付`。但若用户手动取消支付，自动刷新会被关闭，用户若想继续支付需重新加载页面。用户二维码中的内容采用我们自己设计的SHC加密设计，以时间戳为密钥，六十秒自动更新一次，在不得知时间戳密钥的情况下，用户信息二维码即使被其他人拿到也无法破解。这个机制使得用户信息更加保密，增加了安全性。<br>![WechatIMG69](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG69.jpeg)![WechatIMG71](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG71.jpeg)
    * 根据图书分类找书：用户可以在主页面中的图书分类来查看某类书籍，此处运用了懒加载，下拉会刷新出新的书籍。 ![WechatIMG66](https://github.com/starpxy/BBS/raw/master/WebContent/res/WechatIMG66.jpeg)
* 管理员模块<br>
    * 登陆：与普通用户不同，管理员只能通过用户名密码登入登出，且进行任何操作时都会验证管理员session，若session失效，则需重新登录。
    * 确认借书：当管理员主页面（登陆后的第一个页面）完全加载完毕后，点击右上方的二维码标识，会调起微信扫一扫功能。
    
