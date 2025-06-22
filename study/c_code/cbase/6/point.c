#include<stdio.h>

int main(int argc, const char *argv[])
{
//	int a;

//	int *p;//定义一个指针变量,名字叫做p，类型叫做int *
//	p = &a;	

//  int *p = &a;
	
	int *p = NULL;//这里的*就是用来表示p是一个指针的。
	//NULL是0编号地址
	*p = 100;//操作的是指针变量指向的空间。
	//将100存放到p指向的空间中
	return 0;
}

