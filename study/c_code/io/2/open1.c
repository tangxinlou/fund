#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<errno.h>


int main(int argc, const char *argv[])
{
	int fd;

	fd = open("./1.txt",O_RDONLY | O_CREAT | O_EXCL,0664);
	
	if(fd == -1)
	{
		if(errno == EEXIST)//文件已经存在，这里只需要打开
		{
			fd = open("./1.txt",O_RDONLY);	
			printf("success\n");
		}
		else 
		{
			perror("open");
			return -1;
		}
	}
	else //没有出错，说明1.txt文件由当前程序先创建
	{
		printf("!!!!\n");
	}
	//先打开执行代码1，后打开执行代码2，当代码1和代码2功能一致时没有必要使用O_EXCL	
	
	close(fd);
	//默认情况下只要有终端打开，那么就会出现3个默认的文件描述符0 1 2
													  // stdin stdout stderr
	return 0;
}
