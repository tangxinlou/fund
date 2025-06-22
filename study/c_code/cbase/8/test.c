#include<stdio.h>

void fun(const char *p)
{
	printf("%s\n",p);
}

int main(int argc, const char *argv[])
{
//	char str[10] = "world";
	
	if(argc < 2)
	{
		printf("error\n");
		return -1;
	}

	fun(argv[1]);
	return 0;
}

