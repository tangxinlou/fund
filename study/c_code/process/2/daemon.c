#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>

int main(int argc, const char *argv[])
{
	pid_t pid;

	pid = fork();

	if(pid == -1)
	{

	}
	else if(pid == 0)
	{
		//调用setsid函数,使当前子进程变成会话组长,从而事先了脱离原有终端控制
		//一个会话由1个或者多个进程组组成，一个进程组由相同功能的多个进程组成。
		//对于交互进程来说，多个进程组中最多只有一个进程组是前台进程。
		//当调用setsid时如果进程是组长的话，会调用失败。
		setsid();

		//重置文件权限掩码
		umask(0);

		//修改守护进程的工作路径
		chdir("/"); //相当于cd命令

		//关闭从之前父进程中继承的所有文件描述符
		int max_fd;
		max_fd = getdtablesize();//获取一共继承了多少个文件描述符
		
		int fd;
		for(fd = 0;fd < max_fd;fd ++)
			close(fd);

		while(1)
		{
			//服务器代码添加到这里
		}
	}
	else 
	{
		exit(EXIT_SUCCESS);//父进程退出，子进程会变成孤儿进程，孤儿进程会被init收养，后台进程
	}

	return 0;
}
