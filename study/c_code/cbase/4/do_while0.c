#include<stdio.h>

#define a(x)  do{if(x == 1)  printf("hello\n");}while(0)

int main(int argc, const char *argv[])
{
	int x = 0,y = 1;

	if(y)
	 	a(x);
//	if(x == 1)
//		printf("hello\n");
	else
		printf("world\n");

	return 0;
}
