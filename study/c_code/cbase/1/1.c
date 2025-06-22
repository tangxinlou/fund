#include<stdio.h>

int func(int a,int b)
{
	static int m = 0,i = 2;

	i += m + 1;
	m = i + a + b;
	
	printf("i = %d\n",i);
	printf("m = %d\n",m);
	return m;
}

int main(int argc, const char *argv[])
{
	printf("%d\n",func(4,1));
	printf("%d\n",func(4,1));
	return 0;
}
