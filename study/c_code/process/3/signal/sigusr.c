#include<stdio.h>
#include<unistd.h>
#include<signal.h>

void child_handler(int signo)
{
	if(signo == SIGUSR1)
		printf("sigusr1\n");
}

int main(int argc, const char *argv[])
{
	pid_t pid;
	char buf[10];

	pid = fork();

	if(pid == -1)
	{

	}
	else if(pid == 0)
	{
		signal(SIGUSR1,child_handler);
	}
	else 
	{
		scanf("%s",buf);	
		if(strcmp(buf,"start") == 0)
			kill(pid,SIGUSR1);//用户自定义信号通常由某种条件作为前提
	}
	while(1);
	return 0;
}
