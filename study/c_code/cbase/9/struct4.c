#include<stdio.h>

int fun()
{
	printf("hello\n");
	return 0;
}

struct B 
{
	int (*q)();
};

struct A
{
	int a;
	char b;
	struct B y;
//	struct A y;结构体不能直接引用结构体成员本身
};

int main(int argc, const char *argv[])
{
	struct A x;
	struct A *p = &x;
	
	p->a = 100;//p->a操作的就是a

	printf("%d\n",x.a);
	
	p->y.q = fun;
	(p->y.q)();
	return 0;
}
