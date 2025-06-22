#include<stdio.h>

//void fun(int *p,int n)//指针变量和数组名的关系,这种方式被叫做地址传参
void fun(int p[5],int n)//p[]这是指针变量,本质：p = a;被叫做复制传参
{
//	p ++;p是一个变量
	int i;

	for(i = 0;i < n;i ++)
	{
		printf("%d\n",*(p + i));
	}
}

int main(int argc, const char *argv[])
{
	int a[5] = {1,2,3,4,5};
	//a ++;数组名是常量
	fun(a,5);
	return 0;
}
