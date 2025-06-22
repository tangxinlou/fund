#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#include<errno.h>

int main(int argc, const char *argv[])
{
	int fd;

	if(mkfifo("./myfifo",0664 | O_EXCL) == -1)//创建一个有名管道文件
	{
		if(errno == EEXIST)//有名管道事先已经创建了，当前只需要打开
		{
			printf("readfifo:after\n");
			fd = open("./myfifo",O_RDONLY);
		}
		else 
		{
			perror("mkfifo");
			return -1;
		}
	}
	else//当前进程创建有名管道文件 
	{
		printf("readfifo:front\n");
		fd = open("./myfifo",O_RDONLY);
	}
	
#if 0
	fd = open("./myfifo",O_RDONLY);
	if(fd == -1)
	{

	}
#endif
	char buf[10];

	read(fd,buf,sizeof(buf));
	printf("%s\n",buf);

	close(fd);
	return 0;
}
