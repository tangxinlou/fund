#include<stdio.h>

int main(int argc, const char *argv[])
{
#if 0
	while(1)
	{
		printf("hello");
		usleep(100000);
	}
#endif

	printf("hello");
	fflush(stdout);
	while(1);

	return 0;
}
