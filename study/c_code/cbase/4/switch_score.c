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


	switch(score / 10)
	{
	case 10:
	case 9:
		puts("A");
		break;
	case 8:
		puts("B");
		break;
	case 7:
		puts("C");
		break;
	case 6:
		puts("D");
		break;
	default:
		puts("NO PASS");
	}
	return 0;
}
