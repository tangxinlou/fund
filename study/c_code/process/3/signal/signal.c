#include<stdio.h>
#include<signal.h>

void handler(int signo)
{
	if(signo == SIGINT)
		printf("my name is sigint\n");
	if(signo == SIGQUIT)
		printf("!!!\n");
	if(signo == SIGKILL)
		printf("你能捕捉我?\n");
}

int main(int argc, const char *argv[])
{
//	signal(SIGINT,SIG_IGN);
//	signal(SIGINT,SIG_DFL);

//	signal(SIGKILL,SIG_IGN);//SIGKILL和SIGSTOP不能被忽略、阻塞的。

//	signal(SIGINT,handler);//初始化中断处理函数handler
//	signal(SIGQUIT,handler);
	signal(SIGKILL,handler);	
	printf("test\n");
	pause();
	pause();
	return 0;
}
