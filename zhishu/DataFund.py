#!/usr/bin/python3
import urllib.request
import urllib.parse
import time
import os

localtime = time.localtime(time.time())
print (time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()))

year =  time.strftime("%Y", time.localtime())
true = 1
false = 0
logs = []
logs.append(time.strftime("%Y-%m-%d %H:%M:%S", time.localtime()) + '\n')
print(logs)
os.chdir("D:\work\\fund\zhishu")
##############################################################
print("开始获取今天的指数数据")
logs.append("开始获取今天的指数数据" + '\n')
url = 'https://danjuanfunds.com/djapi/index_eva/dj'  # 菜鸟教程搜索页面
#keyword = 'Python 教程'
#key_code = urllib.request.quote(keyword)  # 对请求进行编码
#print(key_code)
#url_all = url
#print(url_all)
header = {
    'User-Agent':'Mozilla/5.0 (X11; Fedora; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/58.0.3029.110 Safari/537.36'
}   #头部信息
request = urllib.request.Request(url,headers=header)
reponse = urllib.request.urlopen(request).read()

fh = open("./IndexValuation","wb")    # 将文件写入到当前目录中
#print(reponse)
fh.write(reponse)
fh.close()
###############################################################

f = open("./IndexValuation","r+",encoding='utf-8')
indexvalua = f.readline()
f.close()
if indexvalua != "":
    print("获取到当日的指数估值")
    logs.append("获取到当日的指数估值" + '\n')
    indexvalua = eval(indexvalua)
    if str(type(indexvalua)) == "<class 'dict'>":
        date =  indexvalua["data"]["items"][0]["date"]
        date = year + "-" + date
        print(date)
        f = open("./indexdatabase","r+",encoding='utf-8')
        funddata = f.readline()
        f.close()
        if funddata == "":
            print("基金数据还是个空文件")
            logs.append("基金数据还是个空文件" + '\n')
            funddata = {}
            funddata[date] = {}
            funddata[date]["indexvalua"] = indexvalua
            print("当日数据不在写入基金数据源文件里面",date)
            logs.append("当日数据不在写入基金数据源文件里面"+ date + '\n')
            f = open("./indexdatabase","w",encoding='utf-8')    # 将文件写入到当前目录中
            f.write(str(funddata))
            f.close()
        else:
            print("基金数据文件有值")
            logs.append("基金数据文件有值" + '\n')
            funddata = eval(funddata)
            if date in funddata:
                date = date + "在基金数据里面，不需要重复写入"
                print(date)
                logs.append(date + '\n')
            else:
                print("当日数据不在写入基金数据源文件里面",date)
                logs.append("当日数据不在写入基金数据源文件里面"+ date + '\n')
                funddata[date] = {}
                funddata[date]["indexvalua"] = indexvalua
                f = open("./indexdatabase","w",encoding='utf-8')    # 将文件写入到当前目录中
                f.write(str(funddata))
                f.close()
    else:
        print("指数估值不是字典，没有下载到正确的指数估值")
        logs.append("指数估值不是字典，没有下载到正确的指数估值" + '\n')
else:
    print("指数估值是空的")
    logs.append("指数估值是空的" + '\n')
print("今天的指数数据获取结束")
logs.append("今天的指数数据获取结束" + '\n')

###############################################################
print("开始获取今天的净值数据")
logs.append("开始获取今天的净值数据" + '\n')
def getworthdata(fundcode):
    url = "https://danjuanfunds.com/djapi/fund/growth/" + fundcode  + "?day=1y"
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
        worthdata = eval(worthdata )
        if str(type(worthdata)) == "<class 'dict'>" :
            print("净值数据是字典",fundcode)
            logs.append("净值数据是字典 " + fundcode +'\n')
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
    print("需要查找净值的基金代码")
    print(fundlist)
    worthdatabasestr = open("./worthdatabase","r+",encoding='utf-8')
    worthdatabase = worthdatabasestr .readline()
    worthdatabasestr.close()
    worthdatabase = eval(worthdatabase)
    idx1 = 0
    while idx1 < len(fundlist):
        worthdatabase.setdefault(fundlist[idx1],{})
        worthdatalist = getworthdata(fundlist[idx1])
        print("当前基金号",fundlist[idx1],"当前最新基金净值是 ",worthdatalist[-1]["date"],"已经写入的最后净值日期是",sorted(list(worthdatabase[fundlist[idx1]].keys()))[-1])
        logs.append("当前基金号" + fundlist[idx1]  + "当前最新基金净值是 " + worthdatalist[-1]["date"] + "已经写入的最后净值日期是" + sorted(list(worthdatabase[fundlist[idx1]].keys()))[-1] + '\n')
        idj1 = 0
        while idj1 < len(worthdatalist):
            if worthdatalist[idj1]["date"] not in  worthdatabase[fundlist[idx1]]:
                worthdatabase[fundlist[idx1]].setdefault(worthdatalist[idj1]["date"],worthdatalist[idj1]["nav"])
                print("写入的净值",worthdatalist[idj1]["date"],worthdatalist[idj1]["nav"],fundlist[idx1])
                logs.append("写入的净值 " + "日期" + worthdatalist[idj1]["date"] + "净值是" + worthdatalist[idj1]["nav"] + "基金代码是" + fundlist[idx1] + '\n')
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




logs.append(logs[0])
logs.append('\n')

f = open("./logs","a+",encoding='utf-8')
f.writelines(logs)
f.close
