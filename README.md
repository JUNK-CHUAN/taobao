# 卖特产的

Table of Contents
=================

   * [接口文档](#接口文档)
      * [1、POST -&gt; /login](#1post---login)
      * [2、POST -&gt; /Register](#2post---register)
      * [3、GET -&gt; /logout](#3get---logout)
      * [4、GET -&gt; /getCurrentUserInfo](#4get---getcurrentuserinfo)
      * [5、GET -&gt; /customerHome](#5get---customerhome)
      * [6、GET -&gt; /getSpecilatyByCategory/{category}](#6get---getspecilatybycategorycategory)
      * [7、GET -&gt; /search/{keyword}](#7get---searchkeyword)
      * [8、GET -&gt; /getSpecialtyInfo/{specialty_id}](#8get---getspecialtyinfospecialty_id)
      * [9、POST -&gt; /insertCart](#9post---insertcart)
      * [10、POST -&gt; /buyFromCart](#10post---buyfromcart)
      * [11、GET -&gt; /currentCustomerOrderList](#11get---currentcustomerorderlist)
      * [12、GET -&gt; /currentSellerOrderList](#12get---currentsellerorderlist)
      * [13、POST -&gt; /setOrderStateSent](#13post---setorderstatesent)
      * [14、GET -&gt; /getSellerSpecialtyList](#14get---getsellerspecialtylist)
      * [15、POST -&gt; /createSpecialty](#15post---createspecialty)
      * [16、POST -&gt; /updateSpecialty](#16post---updatespecialty)
      * [17、POST -&gt; /deleteCart](#17post---deletecart)
      * [18、GET -&gt; /selectCustomerCart](#18get---selectcustomercart)
      * [19、POST -&gt; /buyFromCartWithNewCount](#19post---buyfromcartwithnewcount)
      * [20、GET -&gt; /deleteSpecialty/{spID}](#20get---deletespecialtyspid)
      * [21、POST -&gt; /updateCustomerInfo](#21post---updatecustomerinfo)
      * [22、POST -&gt; /updateSellerInfo](#22post---updatesellerinfo)
      * [23、GET -&gt; /specialtySaleRank](#23get---specialtysalerank)
      * [24、GET -&gt; /setOrderStateRecv/{oID}](#24get---setorderstaterecvoid)
      * [25、POST -&gt; /insertComment](#25post---insertcomment)

Created by [gh-md-toc](https://github.com/ekalinin/github-markdown-toc)





# Usage

use idea import /demo





# 接口文档

## 1、POST -> /login

登陆，会在session中设置登陆标志"isLogIn":"true"

#### RequestParam

"userid" : (string) 即userID

"password" : (string)

"category": (string) "customer" or "seller"

#### Return

成功：{“result": "true"}

失败: {"result": "false"} 



## 2、POST -> /Register

#### RequestParam

"userid" : (string) 

"password" : (string)

"category": (string) "customer" or "seller"

”name": (string) 

"phone": (string) 11位，限制长度

"address": (string) varchar(45)，限制下长度

#### Return

成功：{“result": "true"}

失败: {"result": "false"}   应该是因为userid已经被注册



## 3、GET -> /logout

退出登陆，会清除掉session里的登陆标记

#### Return

{"result": "true"}




## 4、GET -> /getCurrentUserInfo

登陆后，可以获取用户的基本信息

#### Return

未登陆或查询失败：{"result": "false"}

成功获取：

{"result": "true", 

"userid": "xxx",

"categroy": "xxx",

"name": "xxx",

"phone": "xxx",

"address": "xxx"}



## 5、GET -> /customerHome

顾客的主页，分类返回商品，每类有4个商品

#### Return

未登录的话：{“return": "false"}

成功获取：

```
{
    "return": "true",
	"data": {
        "西南":[spObj1, spObj2, spObj3, spObj4],
        "华南":[spObj1, spObj2, spObj3, spObj4],
        "华东":[spObj1, spObj2, spObj3, spObj4],
        "东北":[spObj1, spObj2, spObj3, spObj4],
        "中原":[spObj1, spObj2, spObj3, spObj4],
    }
}

spObj也是一个json，例子如下：

spObj -> {"spID":1311,
"sID":"jerry",
"name":"山东酸辣粉",
"picUrl":"xxxxx url",
"stock":10,
"detail":"这个酸辣粉贼好吃，狠辣",
"category":"东北",
"price":20.8,
"sName":"杰杰",
"sPhone":"13012345678",
"sAddress":"北京市某某地方",
"salesVolume":10,
"detailPics":[
	{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},
	{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}
	]
}
```



## 6、GET -> /getSpecilatyByCategory/{category}

通过地域分类获得该类别的所有特产商品

#### param

category: 嵌入在url上的参数，可以是  西南  华南  华东  东北  中原

#### Return

未登陆：{"result": "false"}

查询不到：{“result”：“true”， “data": []}   应该不会有查询不到的情况，只要参数输对

成功：{"result": "true", "data": [spObj1,  spObj2,  spObj3, ...]}

spObj 的格式见上面。



## 7、GET -> /search/{keyword}

通过关键词搜索商品，会同时搜索商品名、商品简介、商品地域类别、卖家名。

#### param

keyword: 嵌入url的字符串，如 /search/酸辣粉

#### Return（返回格式和上一个getSpecilatyByCategory一样）

未登陆：{"result": "false"}

查询不到：{“result”：“true”， “data": []}   应该不会有查询不到的情况，只要参数输对

成功：{"result": "true", "data": [spObj1,  spObj2,  spObj3, ...]}

spObj 的格式见上面。



## 8、GET -> /getSpecialtyInfo/{specialty_id}

通过商品id获取一件商品的详细信息，可用于商品详情页面和商家编辑商品信息页面。

#### param

specialty_id: 商品id，嵌入url的字符串，如 /getSpecial/111

#### Return

未登录/待查询特产ID不存在: {"result":"false"}

已登录且查询特产ID存在:
{"result":"true",
"data":{

​		"spID":1, 即特产ID
​		"sID":"Jerry", 即商家ID
​		"name":"麻花", 即特产名
​		"picUrl":"6666", 即特产图片地址
​		"stock":120, 即特产库存
​		"detail":"好吃好吃真好吃", 即特产详情
​		"category":"西南",  即特产地域类别
​		"price":40.0,  即特产单价
​		"sName":"陈昌银", 即商家店名
​		"sPhone":"12345", 即商家联系方式
​		"sAddress":"pppp"  即商家地址,
​	   "salesVolume":10,
​		"detailPics":[

​				{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},

​				{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}

​			],
​		"star":3,
​		"comments":[
​			{"oID":13,"text":"还行","star":4,"submitTime":"2020-06-29T09:56:49.000+00:00","cID":"jerry","cName":"jj"},
​			{"oID":12,"text":"还行","star":4,"submitTime":"2020-06-29T09:48:15.000+00:00","cID":"jerry","cName":"jj"},
​			{"oID":11,"text":"真的好好吃","star":1,"submitTime":"2020-06-29T09:45:28.000+00:00","cID":"jerry","cName":"jj"}],
​		"commentNum":3

​	}

}



## 9、POST -> /insertCart

把一件商品加入购物车，如果购物车已经有这件商品，则会叠加数量。

##### RequestParam

"spID": (string or int) 商品id

"count": (string or int) 加购的数量

#### Return

没登陆或者登陆的用户类型不是customer：{"result": "false"}

操作成功: {"result": "true"}



## 10、POST -> /buyFromCart

在购物车中批量购买商品，批量生成订单

#### RequestParam

\*RequestBody是json格式

{"data": [{"spID": "3", "cID": "jerry"}, {"spID": "2", "cID": "jerry"}, {"spID": "11", "cID": "jerry"}], "recvAddress": "重庆大学a区"}

#### Return

没登陆或者登陆的用户类型不是customer：{"result": "false"}

如果某些购买数量超过库存（可能有一部分成功下单，一部分失败）：{"result":"false","reason":"someStockNotEnough"}

操作成功: {"result": "true"}



## 11、GET -> /currentCustomerOrderList

获取当前顾客的订单列表

#### Return

没登陆或者登陆的用户类型不是customer：{"result": "false"}

操作成功：

```json
{"result":"true",
 "data":[
     {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
     {"oID":2,"count":3,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已下单","spID":2,"spName":"广东酸辣粉2","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":6366.0,"expressNo":""}
 	]
}
```



## 12、GET -> /currentSellerOrderList

获取当前商家的订单列表

#### Return

没登陆或者登陆的用户类型不是seller：{"result": "false"}

操作成功：（和上面的格式一模一样）

```json
{"result":"true",
 "data":[
     {"oID":1,"count":6,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"广东酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":124.8,"expressNo":"123456888"},
     {"oID":2,"count":3,"submitTime":"2020-06-19T01:48:09.000+00:00","recvAddress":"重庆大学a区","state":"已下单","spID":2,"spName":"广东酸辣粉2","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","sID":"jerry","sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区","cID":"Jerry","cName":"飞飞","cPhone":"18088884444","sum":6366.0,"expressNo":""}
 	]
}
```



## 13、POST -> /setOrderStateSent

把一个订单的状态改为“已发货” 并设置快递单号

#### RequestParam

“oID”: (string or int) 订单ID

“expressNo”: (string) 快递单号

#### Return

没登陆或者登陆的用户类型不是seller：{"result": "false"}

操作成功：{"result": "true"}



## 14、GET -> /getSellerSpecialtyList

获取当前商家的所有商品列表

#### Return

没有登陆或登陆用户类型不是seller：{"result": "false"}

操作成功：

```json
{"result":"true",
 "data":[
     {"spID":1,"sID":"jerry","name":"广东酸辣粉","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼好吃，狠辣","category":"华南","price":20.8,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "salesVolume":10, "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]},
     {"spID":2,"sID":"jerry","name":"广东酸辣粉2","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼ggg好吃，狠辣","category":"华南","price":2122.0,"sName":"商家飞","sPhone":"18088881231","sAddress":"北京大学某校区", "salesVolume":10, "detailPics":[{"picUrl":"img/123456.jpg","spID":14,"updateTime":"2020-06-24T08:55:08.000+00:00"},{"picUrl":"img/LOGO.png","spID":14,"updateTime":"2020-06-24T08:55:34.000+00:00"}]}
 	]
}
```



## 15、POST -> /uploadPic、POST -> /createSpecialty  
15.1 POST -> /uploadPic
#### RequestParam
 "file"：（MultipartFile）多个图片文件
#### Return
未登录或身份不是商家或者上传目录不存在或者上传过程中失败{"result": "false"}
图片上传成功：{"result": "true"}
15.2 POST -> /createSpecialty

#### RequestParam

“name”: (string) 商品名

  "file"：（MultipartFile）图片文件,
"picUrls":  (List<String>) 存放图片路径的List
“stock”: (int or string) 库存

“detail”: (string) 简介

“category”: (string) 区域类别

“price”: (float or string) 单价

#### Return

没有登陆或登陆用户类型不是seller或目录不存在或上传失败：{"result": "false"}

操作成功：{"result": "true"，"url":"specialty/uuid.jpg"}



## 16、POST -> /updateSpecialty

更新一个商品的信息,前端ajax写法参考demo/src/main/resources/static/pic.html

#### RequestParam

"spID": (int or string) 商品id

“name”: (string) 商品名

  "file"：（MultipartFile）图片文件,

“stock”: (int or string) 库存

“detail”: (string) 简介

“category”: (string) 区域类别

“price”: (float or string) 单价

#### Return

没有登陆或登陆用户类型不是seller或目录不存在或上传失败：{"result": "false"}

操作成功：{"result": "true"，"url":"specialty/uuid.jpg"}



## 17、POST -> /deleteCart

顾客删除自己的购物车的某个特产

#### RequestParam

 {"spList":[1,2,3,4]} 传一个特产ID的数组

#### Return

未登录/不是顾客，返回：{"result":"false"}

登录且是顾客，返回：{"result":"true"}



## 18、GET -> /selectCustomerCart

获取当前顾客的购物车项列表

#### Return

未登录/用户的category不是'customer'，返回：{"result":"false"}

操作成功，返回

```json
{"result":"true",
"data":[
	{"spID":1,"cID":"bobo","count":30,"spName":"麻花","picUrl":"6666","stock":120,"category":"西南","price":40.0,"sID":"Jerry","sName":"陈昌银","sPhone":"12345","sAddress":"pppp"},
	{"spID":2,"cID":"bobo","count":40,"spName":"火锅底料","picUrl":"7777","stock":130,"category":"西南","price":50.0,"sID":"Jerry","sName":"陈昌银","sPhone":"12345","sAddress":"pppp"}
	]
}   
```

"spID"即特产ID，

"cID"即顾客ID,

“count”数量

"spName"即特产名，

"picUrl"即特产图片路径，

"sID"即卖家ID,

"sName"即卖家店名，

"sPhone"，即卖家电话，

"sName", 商家名字

"sAddress"即卖家地址



## 19、POST -> /buyFromCartWithNewCount

在购物车中批量购买商品，批量生成订单

#### RequestParam

\*RequestBody是json格式

{"data": [{"spID": "3", "count": "12"}, {"spID": "2", "count": "7"}, {"spID": "11", "count": "1"}], "recvAddress": "重庆大学a区"}

#### Return

没登陆或者登陆的用户类型不是customer：{"result": "false"}

如果某些购买数量超过库存（可能有一部分成功下单，一部分失败）：{"result":"false","reason":"someStockNotEnough"}

操作成功: {"result": "true"}



## 20、GET -> /deleteSpecialty/{spID}

删除一个商品（虚伪的删除）

#### Return

没登陆或者登陆的用户类型不是seller：{"result": "false"}

操作成功：{"result": "true"}



## 21、POST -> /updateCustomerInfo

修改顾客信息

#### RequestParam

”name": (string) 

"phone": (string) 11位，限制长度

"address": (string) varchar(45)，限制下长度

#### Return

成功：{“result": "true"}

失败: {"result": "false"} 



## 22、POST -> /updateSellerInfo

修改商家信息

#### RequestParam

”name": (string) 

"phone": (string) 11位，限制长度

"address": (string) varchar(45)，限制下长度

#### Return

成功：{“result": "true"}

失败: {"result": "false"} 



## 23、GET -> /specialtySaleRank

按销量获取商品排行榜

#### Return

没登陆：{"result": "false"}

操作成功：

```json
{
    "result": "true", 
    "data": [
        {
            "spID": 935, 
            "sID": "3", 
            "name": "乌江榨菜", 
            "picUrl": "img/testsp/西南/乌江榨菜.jpg", 
            "stock": 310, 
            "detail": "小面是作为南方人的重庆市民唯一普遍接受的面...", 
            "category": "西南", 
            "price": 16, 
            "sName": "重大饭堂旗舰店", 
            "sPhone": "13460986283", 
            "sAddress": "重庆市沙坪坝区沙正街174号", 
            "detailPics": null, 
            "salesVolume": 14
        }, 
        {
            "spID": 936, 
            "sID": "3", 
            "name": "云南花椒", 
            "picUrl": "img/testsp/西南/云南花椒.jpg", 
            "stock": 553, 
            "detail": "小面是作为南方人的重庆市民唯一...", 
            "category": "西南", 
            "price": 46, 
            "sName": "重大饭堂旗舰店", 
            "sPhone": "13460986283", 
            "sAddress": "重庆市沙坪坝区沙正街174号", 
            "detailPics": null, 
            "salesVolume": 10
        }
    ]
}
```


## 23、GET -> /specialtyStarRank

按评价等级获取商品排行榜

#### Return

没登陆：{"result": "false"}

操作成功：

```json
{
    "result": "true", 
    "data": [
        {
            "spID": 935, 
            "sID": "3", 
            "name": "乌江榨菜", 
            "picUrl": "img/testsp/西南/乌江榨菜.jpg", 
            "stock": 310, 
            "detail": "小面是作为南方人的重庆市民唯一普遍接受的面...", 
            "category": "西南", 
            "price": 16, 
            "sName": "重大饭堂旗舰店", 
            "sPhone": "13460986283", 
            "sAddress": "重庆市沙坪坝区沙正街174号", 
            "detailPics": null, 
            "star": 4
        }, 
        {
            "spID": 936, 
            "sID": "3", 
            "name": "云南花椒", 
            "picUrl": "img/testsp/西南/云南花椒.jpg", 
            "stock": 553, 
            "detail": "小面是作为南方人的重庆市民唯一...", 
            "category": "西南", 
            "price": 46, 
            "sName": "重大饭堂旗舰店", 
            "sPhone": "13460986283", 
            "sAddress": "重庆市沙坪坝区沙正街174号", 
            "detailPics": null, 
            "star": 4
        }
    ]
}
```







## 24、GET -> /setOrderStateRecv/{oID}

按销量获取商品排行榜

#### Param

oID: (string or int) 订单id

#### Return

没登陆：{"result": "false"}

成功: {"result": "true"}



## 25、POST -> /insertComment

修改商家信息

#### RequestParam

”oID": (int or string)  订单id

"text": (string)  评论文本

"star": (int or string) 星星数（范围1-5） 

#### Return

成功：{“result": "true"}

失败: {"result": "false"} 



## 剩余需要完成的API

~~1、删除一个Cart项~~

~~2、获取当前顾客的所有cart项~~

~~3、获取当前商家的所有specialty项~~

~~4、新建specialty，用于商家新建商品~~

~~5、修改specialty，用于商家修改商品信息~~

6、图片上传，返回url（具体还不知道怎么和前端整合）







