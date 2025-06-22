#include<stdio.h>
#include<sys/types.h>
#include<fcntl.h>
#include<sys/stat.h>

int main(int argc, const char *argv[])
{
	int fd;
	//文件的实际权限=open的第三个参数 & ~umask
	fd = open("./1.txt",O_RDONLY | O_CREAT,0123);//如果flags使用了O_CREAT则必须使用第三个参数

//	fd = open("./1.txt",O_RDONLY | O_CREAT);这种用法不要出现
	return 0;
}

#if 0
默认权限掩码为002 
原码: 000 000 010 
取反: 111 111 101

664原码:110 110 100 

 110 110 100 
&111 111 101 
 110 110 100    664 

001 010 011 
111 111 101 
001 010 001  

#endif
