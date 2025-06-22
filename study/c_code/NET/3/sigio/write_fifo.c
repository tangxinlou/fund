#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#include<errno.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	int fd;
	if(mkfifo("./fifo",0664 | O_CREAT | O_EXCL) == -1)
	{
		if(errno == EEXIST)
		{
			fd = open("./fifo",O_WRONLY);
		}
		else 
		{
			perror("mkfifo");
			return -1;
		}
	}
	else 
	{
		fd = open("./fifo",O_WRONLY);
	}
	
	char buf[10];
	ssize_t n;
	while(1)
	{
		fgets(buf,sizeof(buf),stdin);
		write(fd,buf,strlen(buf));
	}
	return 0;
}
