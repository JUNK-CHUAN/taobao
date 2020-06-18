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

```json
{
    "return": "true",
	"data": {
    	"西南":[_spObj1_, _spObj2_, _spObj3_, _spObj4_],
        "华南":[_spObj1_, _spObj2_, _spObj3_, _spObj4_],
        "华东":[_spObj1_, _spObj2_, _spObj3_, _spObj4_],
        "东北":[_spObj1_, _spObj2_, _spObj3_, _spObj4_],
        "中原":[_spObj1_, _spObj2_, _spObj3_, _spObj4_],
    }
}

_spObj_也是一个json，例子如下：
_spObj_ -> {"spID":1311,"sID":"jerry","name":"山东酸辣粉","picUrl":"img/123456.jpg","stock":10,"detail":"这个酸辣粉贼好吃，狠辣","category":"东北","price":20.8,"sName":"杰杰","sPhone":"13012345678","sAddress":"北京市某某地方"}
```



