#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[3][4] = {{1,10,3,4},{1,2,3,10},{10,5,10,6}};

	int i,j;
	int r,c;
	int max = a[0][0];
	r = 0;
	c = 0;
	for(i = 0;i < 3;i ++)
	{
		for(j = 0;j < 4;j ++)
		{
			if(a[i][j] > max)
			{
				max = a[i][j];
				r = i;
				c = j;
			}
		}
	}

	for(i = r;i < 3;i ++)
	{
		for(j = 0;j < 4;j ++)
		{
			if(max == a[i][j])
			{
				printf("i = %d,j = %d,max = %d\n",i,j,max);
			}
		}
	}
	return 0;
}
