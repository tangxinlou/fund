#include<stdio.h>

int main(int argc, const char *argv[])
{
	int i,j,k;

	for(i = 0;i < 4;i ++)
	{
		//循环输出空格
		for(j = 0;j <= 2 - i;j ++)
			putchar(' ');
		
		//循环输出*
		for(k = 0;k <= 2 * i;k ++)
			putchar('*');

		printf("\n");
	}

	for(i = 0;i < 3;i ++)
	{
		for(j = 0;j <= i;j ++)
			putchar(' ');

		for(k = 0;k <= 4 - 2 * i;k ++)
			putchar('*');
		
		printf("\n");	
	}
	return 0;
}
