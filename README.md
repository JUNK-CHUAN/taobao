# 卖特产的



# Usage

use idea import /demo/demo 



# 接口文档

## POST -> /login

登陆，会在session中设置登陆标志"isLogIn":"true"

#### RequestParam

"userid" : (string) 即userID

"password" : (string)

"category": (string) "customer" or "seller"

#### Return

成功：{“result": "true"}

失败: {"result": "false"} 



## POST -> /Register

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



## GET -> /logout

退出登陆，会清除掉session里的登陆标记

#### Return

{"result": "true"}




## GET -> /getCurrentUserInfo

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



## GET -> /customerHome

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



## GET -> /getSpecilatyByCategory/{category}

通过地域分类获得该类别的所有特产商品

#### param

category: 嵌入在url上的参数，可以是  西南  华南  华东  东北  中原

#### Return

未登陆：{"result": "false"}

查询不到：{“result”：“true”， “data": []}   应该不会有查询不到的情况，只要参数输对

成功：{"result": "true", "data": [spObj1,  spObj2,  spObj3, ...]}

spObj 的格式见上面。



## GET -> /search/{keyword}

通过关键词搜索商品，会同时搜索商品名、商品简介、商品地域类别、卖家名。

#### param

keyword: 嵌入url的字符串，如 /search/酸辣粉

#### Return（返回格式和上一个getSpecilatyByCategory一样）

未登陆：{"result": "false"}

查询不到：{“result”：“true”， “data": []}   应该不会有查询不到的情况，只要参数输对

成功：{"result": "true", "data": [spObj1,  spObj2,  spObj3, ...]}

spObj 的格式见上面。

