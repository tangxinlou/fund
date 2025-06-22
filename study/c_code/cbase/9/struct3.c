#include<stdio.h>

struct A 
{
	int a;
	char b;
};

int main(int argc, const char *argv[])
{
	struct A x;
	//结构体中变量的使用，有一个规定，使用符号.
	x.b = 'w';
	printf("%c\n",x.b);
	return 0;
}

