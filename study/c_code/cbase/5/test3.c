#include<stdio.h>

int main(int argc, const char *argv[])
{
	int i,j;
	int sum = 0;
	for(i = 6;i < 10000;i ++)
	{
		sum = 0;
		for(j = 1;j <= i / 2;j ++)//某个数字的约数和求完了
		{
			if(i % j == 0)
				sum += j;
		}

		if(sum == i)
			printf("%d\n",i);
	}
	return 0;
}
