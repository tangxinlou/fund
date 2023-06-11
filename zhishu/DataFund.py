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
        f = open("./funddata","r+",encoding='utf-8')
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
            f = open("./funddata","w",encoding='utf-8')    # 将文件写入到当前目录中
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
                f = open("./funddata","w",encoding='utf-8')    # 将文件写入到当前目录中
                f.write(str(funddata))
                f.close()
    else:
        print("指数估值不是字典，没有下载到正确的指数估值")
        logs.append("指数估值不是字典，没有下载到正确的指数估值" + '\n')
else:
    print("指数估值是空的")
    logs.append("指数估值是空的" + '\n')

logs.append(logs[0])
logs.append('\n')

f = open("./logs","a+",encoding='utf-8')
f.writelines(logs)
f.close
