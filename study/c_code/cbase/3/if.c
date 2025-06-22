#include<stdio.h>

int main(int argc, const char *argv[])
{
	int ch;

	ch = getchar();

	if(ch >= 'A' && ch <= 'Z')
		printf("这是一个大写字母\n");
	else if(ch >= 'a' && ch <= 'z')
		printf("这是一个小写字母\n");
	else if(ch >= '0' && ch <= '9') 
		printf("这是一个数字\n");
	else 
		printf("other\n");
	return 0;
}
