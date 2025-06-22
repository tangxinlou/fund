#include<stdio.h>

int main(int argc, const char *argv[])
{
	int i;
	int sum = 0;
#if 0
	for(i = 1;i <= 100;i ++)
	{
		sum += i;
	}
#endif

#if 0
	i = 1;

	for(;i <= 100;i ++)
	{
		sum += i;
	}
#endif 
	
	i = 1;
	for(;i <= 100;)
	{
		sum += i;
		i ++;
	}
	printf("%d\n",sum);
	return 0;
}
