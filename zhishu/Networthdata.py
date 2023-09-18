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
    header = {'User-Agent':'Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'}
    request = urllib.request.Request(url,headers=header)
    reponse = urllib.request.urlopen(request).read()
    fh = open("./worthdata","wb")    # 将文件写入到当前目录中
    fh.write(reponse)
    fh.close()
    worthdatastr = open("./worthdata","r+",encoding='utf-8')
    worthdata = worthdatastr.readline()
    worthdatastr.close()
    if worthdata != "":
        print("获取到净值")
        logs.append("获取到净值" + '\n')
        worthdata = eval(worthdata )
        if str(type(worthdata)) == "<class 'dict'>" :
            print("净值数据是字典",fundcode)
            return worthdata["data"]["fund_nav_growth"]
        else:
            print("净值数据不是字典",fundcode)
            logs.append("净值数据不是字典 " + fundcode +'\n')
    else:
        print("净值数据没有获取到")
        logs.append("净值数据没有获取到" + '\n')       

def setworthdata():
    idx1 = 0
    idj1 = 0
    tempdict = {}
    fundlist = []
    indexkey = []
    fundkey = []
    tempchar = ""
    worthdatalist = []
    numbereddatabasestr = open("./numbereddatabase","r+",encoding='utf-8')
    numbereddatabase = numbereddatabasestr .readline()
    numbereddatabasestr.close()
    logs.append("开始循环获取净值" + '\n')       
    numbereddatabase = eval(numbereddatabase)
    indexkey =  list(numbereddatabase["fundtoindex"].keys())
    while idx1 < len(indexkey):
        idj1 = 0
        fundkey = list(numbereddatabase["fundtoindex"][indexkey[idx1]].keys())
        while idj1 < len(fundkey):
            fundlist.append(numbereddatabase["fundtoindex"][indexkey[idx1]][fundkey[idj1]]["fd_code"])
            idj1 += 1
        idx1 += 1
    print("需要查找净值的基金代码",fundlist)
    worthdatabasestr = open("./worthdatabase","r+",encoding='utf-8')
    worthdatabase = worthdatabasestr .readline()
    worthdatabasestr.close()
    worthdatabase = eval(worthdatabase)
    idx1 = 0
    while idx1 < len(fundlist):
        worthdatabase.setdefault(fundlist[idx1],tempdict)
        worthdatalist = getworthdata(fundlist[idx1])
        idj1 = 0 
        while idj1 < len(worthdatalist):
            worthdatabase[fundlist[idx1]].setdefault(worthdatalist[idj1]["date"],worthdatalist[idj1]["nav"])
            idj1 += 1
        idx1 += 1

    f = open("./worthdatabase","w",encoding='utf-8')    # 将文件写入到当前目录中
    f.write(str(worthdatabase))
    f.close()
    logs.append("结束循环获取净值" + '\n')       
setworthdata()

print("今天的净值数据获取结束")
logs.append("今天的净值数据获取结束" + '\n')
###############################################################
