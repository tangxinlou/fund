#include<stdio.h>

int main(int argc, const char *argv[])
{
	int x;
	int i;
	int quit_num = 0;//退出人数
	int count = 0;//查1，2，3
	int num[1000];
	int *p = num;
	scanf("%d",&x);//总人数

	for(i = 0;i < x;i ++)
	{
		*(p + i) = i + 1;
	}
	
	i = 0;//人在哪个位置
	while(quit_num < x - 1)
	{
		if(*(p + i) != -1)
			count ++;
		if(count == 3)
		{
			*(p + i) = -1;
			quit_num ++;
			count = 0;
		}
	
		i ++;
		if(i == x)
			i = 0;
	}

	while(*p == -1)
		p ++;

	printf("%d\n",*p);
	return 0;
}


