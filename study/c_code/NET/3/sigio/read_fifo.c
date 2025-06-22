#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#include<errno.h>
#include<string.h>
#include<signal.h>

int fd;
ssize_t n;
char buf[10];
void handler(int signo)
{
	if(signo == SIGIO)
	{
		n = read(fd,buf,sizeof(buf));
		buf[n - 1] = '\0';
		printf("%s\n",buf);
	}
}

int main(int argc, const char *argv[])
{
	if(mkfifo("./fifo",0664 | O_CREAT | O_EXCL) == -1)
	{
		if(errno == EEXIST)
		{
		//	fd = open("./fifo",O_RDONLY | O_NONBLOCK);
			fd = open("./fifo",O_RDONLY);
		}
		else 
		{
			perror("mkfifo");
			return -1;
		}
	}
	else 
	{
	//	fd = open("./fifo",O_RDONLY | O_NONBLOCK);
		fd = open("./fifo",O_RDONLY);
	}
	
	signal(SIGIO,handler);//捕捉信号
	
	int flag;
	//产生信号的条件
	flag = fcntl(fd,F_GETFL);
	flag |= O_ASYNC;
	fcntl(fd,F_SETFL,flag);
	
	fcntl(fd,F_SETOWN,getpid());//给当前进程注册SIGIO信号

	while(1)
	{
		printf("hello\n");
		sleep(1);
	}
	return 0;
}
