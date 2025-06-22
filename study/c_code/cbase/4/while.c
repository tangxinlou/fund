#include<stdio.h>

int main(int argc, const char *argv[])
{
	int i = 1;

	int sum = 0;
#if 0
	while(i <= 100)
	{
		sum += i;
		i ++;
	}
	
#endif 
#if 1
	do
	{
		sum += i;
		i ++;
	}while(i <= 100);//这个位置不要忘记分号
#endif
	//当条件成立时while和do while没有区别，但是当条件不成里时while执行0次，do
	//while执行1次
	printf("%d\n",sum);
	return 0;
}
