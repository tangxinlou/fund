#include<stdio.h>

#if 1
void fun();//函数声明
int main(int argc, const char *argv[])
{
	fun();//函数调用
	
	return 0;
}
void fun()//函数定义——函数的功能
{
	printf("hello\n");
}

#endif

#if 0
void fun()//函数定义和声明结合起来
{
	printf("hello\n");
}

int main(int argc, const char *argv[])
{
	fun();//函数调用
	return 0;
}
#endif

