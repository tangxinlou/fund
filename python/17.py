#!/usr/bin/python3
import urllib.request
import urllib.parse

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

fh = open("./urllib_test_runoob_search.html","wb")    # 将文件写入到当前目录中
print(reponse)
fh.write(reponse)
fh.close()
