#include<stdio.h>

#if 0
struct 
{
	int a;
	char b;
}x,y,z;

struct A
{
	int a;
	char b;
}y;
#endif

typedef struct A 
{
	int a;
	char b;
}mystruct_t;
//mystruct_t是一个结构体类型别名
int main(int argc, const char *argv[])
{
//	struct p;不允许单独使用struct来定义一个变量
//	p.a = 10;

//	struct A x;
//	x.a = 10;
	
	mystruct_t x;
	return 0;
}
