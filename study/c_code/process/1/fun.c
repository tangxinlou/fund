#include<stdio.h>
#include<stdlib.h>
#include<unistd.h>

int fun()
{
	printf("hello");
//	return 0;
	exit(1);
//	_exit(1);
}

int main(int argc, const char *argv[])
{
	fun();
	printf("end\n");
	return 0;
}
