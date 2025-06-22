#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 10;
	int b = 20;
	int c;

//	c = a ++ + ++ b;
	a = a ++ + ++b;
	printf("%d\n",a);

	return 0;
}

//if((fd = socket(,,)) == -1)
