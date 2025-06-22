#include<stdio.h>

int main(int argc, const char *argv[])
{
	//putchar内部可以传递常量、常量表达式、变量、变量表达式
	char ch = 'w';
	putchar(97);
	putchar('a');
	putchar('a' + 1);
	putchar(ch);
	putchar(ch + 1);
	putchar('\n');

	return 0;
}
