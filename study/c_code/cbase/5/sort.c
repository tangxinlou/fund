#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a[5] = {12,5,78,123,6};

	int max,index,temp;
	int i,j;

	for(i = 0;i < 4;i ++)
	{
		max = a[i];
		index = i;

		for(j = i + 1;j < 5;j ++)
		{
			if(max < a[j])
			{
				max = a[j];
				index = j;
			}
		}

		temp = a[i];
		a[i] = a[index];
		a[index] = temp;
	}

	for(i = 0;i < 5;i ++)
	{
		printf("%d\t",a[i]);
	}
	printf("\n");
	return 0;
}
