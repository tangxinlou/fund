#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[3][4] = {{1,2,3,4},{5,6,7,8},{9,10,11,12}};
//	int (*)[4] p;//这里的错误是编译器问题，老版本编译器允许这样做。现在编译器不允许。
	int (*p)[4];//如果有一个指针类型是 xxx (*)yyy,定义的变量或者数组或者函数，都放到括号内部*的后面
	//这里为什么出现[4],就是为了告诉指针，每次加1跳一行时，需要跳过4个元素。
	
	p = a;
	int i,j;
	
	for(i = 0;i < 3;i ++)
	{
		for(j = 0;j < 4;j ++)
		{
//			printf("%d\t",a[i][j]);
//			printf("%d\t",*(*(a + i) + j));	
//			printf("%d\t",*(a[i] + j));	
			
			printf("%d\t",p[i][j]);
			printf("%d\t",*(*(p + i) + j));	
			printf("%d\t",*(p[i] + j));	
		}
	}
	printf("\n");
	return 0;
}

