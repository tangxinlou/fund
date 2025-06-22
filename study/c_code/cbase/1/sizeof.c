#include<stdio.h>
#include<stdlib.h>

int main(int argc, const char *argv[])
{
	char *p;
	double *q;

	int (*x)(int);

	p = malloc(100);

	printf("%d\n",sizeof(p));
	printf("%d\n",sizeof(q));
	printf("%d\n",sizeof(x));
	return 0;
}
