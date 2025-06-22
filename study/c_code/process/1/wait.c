#include<stdio.h>
#include<sys/wait.h>
#include<stdlib.h>

int main(int argc, const char *argv[])
{
	pid_t pid;
	int status;

	pid = fork();

	if(pid == -1)
	{

	}
	else if(pid == 0)
	{
		printf("child\n");	
		exit(8);
	//	while(1);
	}
	else 
	{
		printf("father\n");
		wait(&status);
		printf("%x\n",status);
		printf("end\n");
		while(1);
	}
	return 0;
}
