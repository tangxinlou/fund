#include<stdio.h>

int main(int argc, const char *argv[])
{
	int i;

	for(i = 1;i <= 10;i ++)
	{
		if(i % 3 == 0)
			continue;
		printf("%d\n",i);
	}
	return 0;
}

