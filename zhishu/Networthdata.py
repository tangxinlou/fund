#!/usr/bin/python3
import urllib.request
import urllib.parse
import time
import os

true = 1
false = 0
logs = []
###############################################################
print("开始获取今天的净值数据")
logs.append("开始获取今天的净值数据" + '\n')


def getworthdata(fundcode):
    url = "https://danjuanfunds.com/djapi/fund/growth/" + fundcode  + "?day=all"
    print(url)
    header = {'User-Agent':'Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'}
    request = urllib.request.Request(url,headers=header)
    reponse = urllib.request.urlopen(request).read()
    fh = open("./worthdata","wb")    # 将文件写入到当前目录中
    fh.write(reponse)
    fh.close()
    worthdatastr = open("./IndexValuation","r+",encoding='utf-8')
    worthdata = f.readline()
    if worthdata != "":
        print("获取到净值")
        logs.append("获取到净值" + '\n')
        worthdata = eval(worthdata )
            if str(type(indexvalua)) == "<class 'dict'>":
                

            else:
                print("净值数据不是字典")
                logs.append("净值数据不是字典" + '\n')
    else:
        print("净值数据没有获取到")
        logs.append("净值数据没有获取到" + '\n')       
    worthdatastr.close()
    print("子函数")

getworthdata("001594")


print("今天的净值数据获取结束")
logs.append("今天的净值数据获取结束" + '\n')
############################################################### 
