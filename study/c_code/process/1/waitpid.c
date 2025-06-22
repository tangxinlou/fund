//一个父进程产生两个子进程
#include<stdio.h>
#include<stdlib.h>
#include<sys/wait.h>
#include<unistd.h>


int main(int argc, const char *argv[])
{
	pid_t pid1,pid2;

	pid1 = fork();

	if(pid1 == -1)
	{
		perror("fork");
		exit(EXIT_FAILURE);
	}
	else if(pid1 == 0)//子进程1
	{
		printf("child1:%d,%d\n",getpid(),getppid());//getpid()获取当前进程的进程号	getppid()获取当前进程的父进程号
	}
	else 
	{
		pid2 = fork();
		if(pid2 == -1)
		{

		}
		else if(pid2 == 0)//子进程2
		{
			printf("child2:%d\n",getpid());
		}
		else//父进程 
		{
			printf("father:%d\n",getpid());
//			waitpid(-1,NULL,0);// <==> wait(NULL)
//			waitpid(pid1,NULL,0);
			waitpid(pid1,NULL,WNOHANG);
			printf("end\n");
		}
	}
	while(1);
	return 0;
}
