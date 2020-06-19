import requests
import json
url = 'http://127.0.0.1:8080/login'
d = {'userid': 'chuan', 'password': '123', 'category': 'seller'}
r = requests.post(url, data=d)
print(r.text)
cookies = r.cookies

# url = 'http://127.0.0.1:8080/register'
# d = {'userid': 'jerry', 'password': '123', 'category': 'seller',
#         'name':'刘boss', 'phone':"18029366913", 'address':"广东省佛山市沙坪坝区重庆大学A区"}
# r = requests.post(url, data=d)
# print(r.text)

# url = 'http://127.0.0.1:8080/getCurrentUserInfo'
# r = requests.get(url, cookies=cookies)
# print(r.text)


# url = 'http://127.0.0.1:8080/insertCart'
# d = {"spID": "2", "count": "3"}
# r = requests.post(url, data=d, cookies=cookies)
# print(r.text)

# url = 'http://127.0.0.1:8080/buyFromCart'
# d = {"data": [{"spID": "1", "cID": "jerry"}, {"spID": "2", "cID": "jerry"}], "recvAddress": "重庆大学a区"}
# r = requests.post(url, data=json.dumps(d), cookies=cookies)
# print(r.text)

# url = 'http://127.0.0.1:8080/setOrderStateSent'
# d = {"oID": "1", "expressNo": "123456888"};
# r = requests.post(url, data=d, cookies=cookies)
# print(r.text)

# url = 'http://127.0.0.1:8080/createSpecialty'
# d = {"name": "火锅底料", "picUrl": "123456888.jpg", 
# "stock": 14, "detail": "adfafaf", 
# "category": "华南", "price": 12.01};
# r = requests.post(url, data=d, cookies=cookies)
# print(r.text)

url = 'http://127.0.0.1:8080/updateSpecialty'
d = {"spID": 9,"name": "蛋糕", "picUrl": "123456888.jpg", 
"stock": 0, "detail": "adfafaf", 
"category": "华南", "price": 12.01};
r = requests.post(url, data=d, cookies=cookies)
print(r.text)