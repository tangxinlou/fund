#include<stdio.h>

int main(int argc, const char *argv[])
{
	char str[10];
	printf("请输入内容不要超过10个字符\n");
	gets(str);
	puts(str);
	return 0;
}
