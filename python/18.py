#!/usr/bin/python3
import requests

# 发送请求
x = requests.get('https://www.runoob.com/')

# 返回网页内容
print(x.text)
