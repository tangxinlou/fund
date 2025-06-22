#include<stdio.h>
#include<signal.h>

void handler(int signo)
{
	if(signo == SIGALRM)
		printf("timer out\n");
}

int main(int argc, const char *argv[])
{
	signal(SIGALRM,handler);
	printf("start\n");
	alarm(5);
	printf("end\n");
	pause();//当没有收到信号时阻塞，收到信号时唤醒
	return 0;
}
