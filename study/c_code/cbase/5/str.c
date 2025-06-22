#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[5];//这是一个一维数组，存放的数据是整型，有5个元素。

	int i;

	for(i = 0;i < 5;i ++)
	{
		a[i] = i;
		scanf("%d",&a[i]);
	}

	for(i = 0;i < 5;i ++)
		printf("%d\t",a[i]);
	printf("\n");
	return 0;
}
