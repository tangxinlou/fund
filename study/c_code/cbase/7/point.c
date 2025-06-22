#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[2][3];

	//取出二维数组中实际元素，要对列指针操作
	printf("a[1] = %p\n",a[1]);
	printf("a[1] + 1 = %p\n",a[1] + 1);
	printf("*(a + 1) = %p\n",*(a + 1));
	printf("*(a + 1) + 1 = %p\n",*(a + 1) + 1);

	printf("********************\n");

	printf("a + 1 = %p\n",a + 1);
	printf("a + 1 + 1 = %p\n",a + 1 + 1);
	printf("&a[1] = %p\n",&a[1]);
	printf("&a[1] + 1 = %p\n",&a[1] + 1);

	//行指针取*变成列指针       列指针取地址变成行指针
	//列指针取*获取了空间具体值
	return 0;
}
