#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
#if 0
	printf("hello\n");
	fork();
	printf("world\n");

	while(1);
#endif

	fork();
	fork();
	printf("hello world\n");
	return 0;
}
