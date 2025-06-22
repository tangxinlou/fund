#include<stdio.h>

extern int b;
extern int fun();

int main(int argc, const char *argv[])
{
	printf("%d\n",b);
	printf("%d\n",fun());
	return 0;
}

