#include<stdio.h>

int mystrlen(char *p)
{
	int len = 0;
	while(*p != '\0')
	{
		p ++;
		len ++;
	}

	return len;
}

int main(int argc, const char *argv[])
{
	char str[] = "hello world";
	int len;
	len = mystrlen(str);
	printf("%d\n",len);
	return 0;
}
