#include<stdio.h>

int main(int argc, const char *argv[])
{
	int score;

	scanf("%d",&score);
	
	if(score > 100 || score < 0)
	{
		printf("error\n");
		return -1;
	}
#if 0
	if(score >= 90)
		puts("A");
	else if(score >= 80)
		puts("B");
	else if(score >= 70)
		puts("C");
	else if(score >= 60)
		puts("D");
	else 
		puts("NO PASS");
#endif

	if(score < 90)	
	{
		if(score < 80)
		{
			if(score < 70)
			{
				if(score < 60)
				{
					puts("NO PASS");
				}
				else 
				{
					puts("D");
				}
			}
			else 
			{
				puts("C");
			}
		}
		else 
		{
			puts("B");
		}
	}
	else 
		puts("A");
	return 0;
}
