#!/usr/bin/python3
import time

ticks = time.time()
print("当前时间戳",ticks)
localtime = time.localtime(time.time())
print ("本地时间为 :", localtime)
print (time.strftime("%Y", time.localtime()))

string1 = "12345"
dict1 = {"12":"34","13":"56"}
print(type(string1))
print(type(dict1))

f = open("./fundData","r+")
str = f.readline()
print(str)
if str == "":
    print("null")
else:
    print(str)
