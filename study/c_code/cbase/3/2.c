#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 10;
	int b = 20;
#if 0
	int temp;

	temp = a;
	a = b;
	b = temp;
#endif

	a = a ^ b;
	b = a ^ b;
	a = a ^ b;
	printf("a = %d,b = %d\n",a,b);
	return 0;
}
