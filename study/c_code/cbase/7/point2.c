#include<stdio.h>

int main(int argc, const char *argv[])
{
	char * str[3] = {"hello","world","farsight"};//数组存放的是三个字符串的首地址
//	char str[][10] = {"hello","world","farsight"};//存放三个字符串

	char **p = str;

	//p + 2指向str[2]空间，并且str[2]空间存放的是&f
	//*(p + 2)获得了&f
	//*(p + 2) + 3获得了s的地址
	printf("%c\n",*(*(p + 2) + 3));
	printf("%c\n",*(str[2] + 3));
	return 0;
}
