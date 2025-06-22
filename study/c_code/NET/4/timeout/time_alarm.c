#include<stdio.h>
#include<signal.h>
#include<unistd.h>
#include<string.h>

void func(int signo)
{
	if(signo == SIGALRM)
		printf("time out\n");
}

int main(int argc, const char *argv[])
{
//	signal(SIGALRM,func);
	
	struct sigaction act;

	sigaction(SIGALRM,NULL,&act);
	act.sa_handler = func;
//	act.sa_flags |= SA_RESTART;<==> signal(SIGALRM,func);
	act.sa_flags &= ~SA_RESTART;
	sigaction(SIGALRM,&act,NULL);
	char buf[10];
	while(1)
	{
		alarm(5);//定时5s，当5s到达后会产生SIGALRM
		memset(buf,0,sizeof(buf));
		if(read(0,buf,sizeof(buf)) == -1)
		{
			perror("read");
		}
		printf("%s\n",buf);
	}
	return 0;
}
