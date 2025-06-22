#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[5] = {1,2,3,4,5};
	int *p = a;

	int i;

	//用指针变量，打印数组中所有元素内容
	for(i = 0;i < 5;i ++)
	{
		printf("%d\t",*(p + i));
		
		printf("%d\t",p[i]);
	//	printf("%d\t",a[i]);
	}
	//当前为止，指针好像是多余的?是么？自己思考
	printf("\n");
	return 0;
}
