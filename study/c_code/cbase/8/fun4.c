#include<stdio.h>

int fun(int a)
{
	printf("%d\n",a);
	return 0;
}

int main(int argc, const char *argv[])
{
//	fun(10);

	int (*p)(int);
	p = fun;
//	p(10);
	(*p)(10);
	//(*p)(10)是正确的，p(10)是错误的。但是鲁迅说:世上本没有路，走的人多了便成了路
	//很多人习惯使用p(10)这种格式，所以当编译器版本根新后就支持了这种用法
	return 0;
}
