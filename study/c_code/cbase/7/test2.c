#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[5];
	char *s = "hello world";//指针s存放了字符串首地址

	char *p = (char *)a;
	char *q = p;//记录一下首地址	
	while(*s != '\0')//ab\0
	{
		*p ++ = *s ++;
	}
	*p = '\0';
	
	printf("%s\n",q);
	return 0;
}
