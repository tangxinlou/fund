#include<stdio.h>
#include<unistd.h>
#include<signal.h>
#include<stdlib.h>

pid_t pid;
void child_handler(int signo)
{
	if(signo == SIGINT)
		kill(getppid(),SIGUSR1);
	if(signo == SIGQUIT)
		kill(getppid(),SIGUSR2);

	if(signo == SIGUSR1)
	{
		printf("get off the bus\n");
		kill(getppid(),SIGKILL);
		exit(EXIT_SUCCESS); 
	}
}

void father_handler(int signo)
{
	if(signo == SIGUSR1)
		printf("lets gogogo\n");

	if(signo == SIGUSR2)
		printf("stop the bus\n");

	if(signo == SIGTSTP)
		kill(pid,SIGUSR1);
}

int main(int argc, const char *argv[])
{

	pid = fork();

	if(pid == -1)
	{

	}
	else if(pid == 0)
	{
		signal(SIGINT,child_handler);

		signal(SIGQUIT,child_handler);

		signal(SIGTSTP,SIG_IGN);
		signal(SIGUSR1,child_handler);
	}
	else 
	{
		signal(SIGINT,SIG_IGN);
		signal(SIGUSR1,father_handler);

		signal(SIGQUIT,SIG_IGN);
		signal(SIGUSR2,father_handler);

		signal(SIGTSTP,father_handler);
	}
	while(1);
	return 0;
}
