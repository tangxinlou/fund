#include<stdio.h>


int main(int argc, const char *argv[])
{
	int a[5] = {12,4,6,8,1};

	int *p = &a[0];
	int *q = &a[4];
	int t;
	while(p < q)
	{
		t = *p;
		*p = *q;
		*q = t;
		p ++;
		q --;
	}

	int i;

	for(i = 0;i < 5;i ++)
		printf("%d\t",a[i]);
	printf("\n");
	return 0;
}
