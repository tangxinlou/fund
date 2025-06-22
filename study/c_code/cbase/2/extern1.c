#include<stdio.h>

int main(int argc, const char *argv[])
{
	extern int a;
	printf("%d\n",a);
	return 0;
}

int a = 10;
