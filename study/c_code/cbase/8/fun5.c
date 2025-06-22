#include<stdio.h>

void (*fun(int,void (*)(int)))(int);//fun函数的声明
//fun是一个函数声明，有两个行参，第一个是int，第二个是void (*)(int)
//返回值是void (*)(int);
//
void farsight(int);
int main(int argc, const char *argv[])
{
	void (*q)(int);//根据fun返回值类型来定义的
	q = fun(10,farsight);//fun函数调用,farsight函数的原型怎么来的？根据fun函数的第二个参数
	//指针q就是存放了p，间接存放了farsight，所以对q的调用就是对farsight的调用
	q(100);
	return 0;
}

void farsight(int no)
{
	printf("no = %d\n",no);
}

void (*fun(int no,void (*p)(int)))(int)//行参no = 10,行参p = farsight,以后对p的调用就是对farsight函数的调用
{
	p(no);//调用farsight函数，并且给farsight函数传参为no=10

	return p;
}
