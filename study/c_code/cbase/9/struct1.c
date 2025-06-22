#include<stdio.h>

struct A
{
	int a;
	char b;
}x = {
	10,
	'w'
};
//x是全局变量
int main(int argc, const char *argv[])
{
	int a[5] = {
		1,
		2,
		3,
		4,
		5
	};	

	struct A y = {100,'z'};//这里的y是局部变量

	return 0;
}
