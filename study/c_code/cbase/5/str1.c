#include<stdio.h>

int main(int argc, const char *argv[])
{
#if 0
	//int a[5] = {1,2,3,4,5};//全部初始化
	int a[] = {1,2,3,4,5,6,7,8,9};//也是全部初始化，只不过数组大小由元素个数决定的。
#endif
	int a[5] = {1};//部分初始化的数组，没有初始化的部分默认为0
//	int a[5] = {0};//将数组所有元素都置为0
	int i;

	for(i = 0;i < sizeof(a) / sizeof(int);i ++)
		printf("%d\t",a[i]);
	printf("\n");
	
	return 0;
}
