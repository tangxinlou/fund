#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[3][3] = {{1,2,3},{4,5,6},{7,8,9}};

	int max,min;
	int r,c;

	int i,j,k;
	int count = 0;
	for(i = 0;i < 3;i ++)
	{
		max = a[i][0];
		c = i;

		for(j = 1;j < 3;j ++)
		{
			if(a[i][j] > max)
			{
				max = a[i][j];
				c = j;
			}
		}

		min = a[i][c];
		r = i;

		for(k = 0;k < 3;k ++)
		{
			if(min > a[k][c])
			{
				min = a[k][c];
				r = k;
			}
		}

		if(r == i)
		{
			count ++;
			printf("%d\n",a[r][c]);
		}
	}
	if(count == 0)
		printf("没有合适的数据\n");
	return 0;
}
