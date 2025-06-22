#include<stdio.h>

int main(int argc, const char *argv[])
{
	int i,j,k;
	int sum = 0;
	int count = 0;
	for(i = 1;i <= 4;i ++) //代表百位
	{
		for(j = 1;j <= 4;j ++) //十位
		{
			for(k = 1;k <= 4;k ++)//个位
			{
				if(i != j && i != k && j != k)
				{
					sum = i * 100 + j * 10 + k;
					count ++;
					printf("sum = %d ",sum);
					
	//				if(count % 5 == 0)
	//					printf("\n");
				}
			}
		}
		printf("\n");
	}
	//printf("\n");
	printf("count = %d\n",count);
	return 0;
}
