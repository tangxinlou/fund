#include<stdio.h>

int main(int argc, const char *argv[])
{
	int num;

	int i,j,k;
	for(num = 100;num < 1000;num ++)
	{
		i = num / 100;
		j = num / 10 % 10;
		k = num % 10;

		if(num == i * i * i + j * j * j + k * k *k)
			printf("%d\n",num);
	}
	return 0;
}
