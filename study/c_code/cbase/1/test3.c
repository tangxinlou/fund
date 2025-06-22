#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[2][3] = {1,2,3,4,5,6};
	int i,j;
	int sum = 0;
#if 0
	for(i = 0;i < 2;i ++)
	{
		for(j = 0;j < 3;j ++)
		{
			sum += a[i][j];
		}
	}
#endif
	
	int *str[2] = {a[0],a[1]};
	
	for(i = 0;i < 2;i ++)
	{
		for(j = 0;j < 3;j ++)
		{
			sum += *(str[i] + j);
		}
	}
	printf("sum = %d\n",sum);
	return 0;
}
