#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 10;
	int b = 20;

	int c;

//	c = a > b ? 110 : 101;
	if(a > b)	
		c = 110;
	else 
		c = 101;
	printf("%d\n",c);
	return 0;
}
