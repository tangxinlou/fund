#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 5;
	int b = 3;

	printf("%d\n",a / b);
	printf("%f\n",(float)a / b);

#if 0
	int *p;
	int *q;

	printf("%d\n",*p/*q);

#endif
	return 0;
}

