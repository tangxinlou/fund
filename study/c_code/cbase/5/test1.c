#include<stdio.h>

int main(int argc, const char *argv[])
{
	int n;
	int odd_ct = 0;
	int even_ct = 0;
	while(1)
	{
		scanf("%d",&n);

		if(n == 0)
			break;

		if(n % 2 == 1)
			odd_ct ++;

		if(n % 2 == 0)
			even_ct ++;

	}

	printf("odd_ct:%d,even_ct:%d\n",odd_ct,even_ct);
	return 0;
}
