#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
	struct stat info;
	stat("./close.c",&info);//可以获取参数1文件的属性，属性内容存放到struct stat结构体中

	printf("%lld\n",info.st_dev);
	printf("%o\n",info.st_mode);//代表了文件类型以及文件权限

	printf("%d\n",info.st_nlink);
	printf("%ld\n",info.st_mtime);
	return 0;
}
