#include<stdio.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
	pid_t pid;
	
	int fd[2];
	pipe(fd);//执行成功fd[0],fd[1]分别存放的具有读和写功能的文件描述符
	pid = fork();

	if(pid == -1)
	{

	}
	else if(pid == 0)
	{
		close(fd[0]);//子进程写管道
		write(fd[1],"hello",5);
	}
	else 
	{	
		close(fd[1]);//父进程读管道
		char buf[10];
		read(fd[0],buf,sizeof(buf));
		printf("%s\n",buf);
	}
	return 0;
}
