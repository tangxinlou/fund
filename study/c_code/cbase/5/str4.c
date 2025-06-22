#include<stdio.h>

int main(int argc, const char *argv[])
{
	//数组名a代表的是整个数组，a[0]代表的是数组的第一个元素
	int a[5];

	printf("&a[0]:%p\n",&a[0]);
	printf("&a[0] + 1:%p\n",&a[0] + 1);
//	printf("a:%p\n",a);
//	printf("a + 1:%p\n",a + 1);

	printf("&a:%p\n",&a);
	printf("&a + 1:%p\n",&a + 1);
//	printf("%d\n",sizeof(a[0]));
//	printf("%d\n",sizeof(a));
	return 0;
}
