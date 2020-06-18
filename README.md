# 卖特产的



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
"sAddress":"北京市某某地方"}
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
​		"sAddress":"pppp"  即商家地址}

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

操作成功: {"result": "true"}



## 11、GET -> /currentCustomerOrderList

获取当前顾客的订单列表

#### Return

没登陆或者登陆的用户类型不是customer：{"result": "false"}

操作成功：

```json
{"result":"true",
 "data":[
     {"oID":5,"count":320,"submitTime":"2020-06-18T18:04:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"重庆酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"西南","sID":"jerry","sName":"杰杰","sPhone":"18029366999","sAddress":"重庆市沙坪坝区重庆大学A区","cID":"Jerry","cName":"杰杰","cPhone":"18029366999","sum":6656.0},	
     {"oID":6,"count":3,"submitTime":"2020-06-18T18:05:34.000+00:00","recvAddress":"重庆大学a区","state":"已下单","spID":1,"spName":"重庆酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"西南","sID":"jerry","sName":"杰杰","sPhone":"18029366999","sAddress":"重庆市沙坪坝区重庆大学A区","cID":"Jerry","cName":"杰杰","cPhone":"18029366999","sum":62.4},
     {"oID":7,"count":3,"submitTime":"2020-06-18T18:07:57.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":3,"spName":"重庆酸辣粉3","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼ggggg好吃，狠辣","category":"西南","sID":"jerry","sName":"杰杰","sPhone":"18029366999","sAddress":"重庆市沙坪坝区重庆大学A区","cID":"Jerry","cName":"杰杰","cPhone":"18029366999","sum":60.6}
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
     {"oID":5,"count":320,"submitTime":"2020-06-18T18:04:09.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":1,"spName":"重庆酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"西南","sID":"jerry","sName":"杰杰","sPhone":"18029366999","sAddress":"重庆市沙坪坝区重庆大学A区","cID":"Jerry","cName":"杰杰","cPhone":"18029366999","sum":6656.0},	
     {"oID":6,"count":3,"submitTime":"2020-06-18T18:05:34.000+00:00","recvAddress":"重庆大学a区","state":"已下单","spID":1,"spName":"重庆酸辣粉","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼好吃，狠辣","category":"西南","sID":"jerry","sName":"杰杰","sPhone":"18029366999","sAddress":"重庆市沙坪坝区重庆大学A区","cID":"Jerry","cName":"杰杰","cPhone":"18029366999","sum":62.4},
     {"oID":7,"count":3,"submitTime":"2020-06-18T18:07:57.000+00:00","recvAddress":"重庆大学a区","state":"已发货","spID":3,"spName":"重庆酸辣粉3","picUrl":"img/123456.jpg","detail":"这个酸辣粉贼ggggg好吃，狠辣","category":"西南","sID":"jerry","sName":"杰杰","sPhone":"18029366999","sAddress":"重庆市沙坪坝区重庆大学A区","cID":"Jerry","cName":"杰杰","cPhone":"18029366999","sum":60.6}
    ]
}
```



## 13、POST -> /setOrderStateSent

把一个订单的状态改为“已发货” \*(数据库中没有运单号的属性，因此这个API不用传输运单号字段，后续可能会改变该API)

#### RequestParam

oID: (string or int) 订单ID

#### Return

没登陆或者登陆的用户类型不是seller：{"result": "false"}

操作成功：{"result": "true"}



## 剩余需要完成的API

1、删除一个Cart项

2、获取当前顾客的所有cart项

3、获取当前商家的所有specialty项

4、新建specialty，用于商家新建商品

5、修改specialty，用于商家修改商品信息

6、删除一个specialty



