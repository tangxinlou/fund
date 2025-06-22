#include<stdio.h>

int main(int argc, const char *argv[])
{
	int i;
	int sum = 0;
	while(1)
	{
		for(i = 1;i <= 100;i ++)//这是一层循环，一共有100次
		{
			sum += i;
			if(sum > 2000)
	//			break;//跳出本层循环,一个break只能跳出一层循环。
			    goto abc;//需要一次跳出多层循环时建议使用goto，使用goto要注意，不能在函数外使用(abc是一个局部标号)。
		}
	}
abc:
	printf("sum = %d\n",sum);
	return 0;
}
