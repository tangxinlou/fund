#include<stdio.h>
#include<signal.h>

int main(int argc, const char *argv[])
{
	printf("start\n");
	kill(getpid(),SIGKILL);//raise(SIGKILL);
	printf("end\n");
	while(1);
	return 0;
}
