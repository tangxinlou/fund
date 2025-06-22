#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 10;
	int b = 20;

//	const int *p = &a;
	int *const p = &a;
	p = &b;
	*p = 100;
// 	如果const出现在*的前面，不关心指针指向哪个空间，关心的是只要有指向的空间，那么这个空间中的内容就是只读的
// 	如果const出现在*的后面，关心的是指针指向的空间(指针存放的地址是只读的)
	return 0;
}
