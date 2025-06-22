#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#include<errno.h>

int main(int argc, const char *argv[])
{
	int fd;
	
	if(mkfifo("./myfifo",0664) == -1)
	{
		if(errno == EEXIST)
		{
			printf("writefifo:after\n");
			fd = open("./myfifo",O_WRONLY);
		}
		else 
		{
			perror("mkfifo");
			return -1;

		}
	}
	else 
	{
		printf("writefifo:front\n");
		fd = open("./myfifo",O_WRONLY);
	}
#if 0
	fd = open("./myfifo",O_WRONLY);
	{

	}
#endif
	write(fd,"hello",5);
	close(fd);
	return 0;
}
