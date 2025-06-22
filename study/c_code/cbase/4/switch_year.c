#include<stdio.h>

int main(int argc, const char *argv[])
{
	int year,month,day;
	int sum = 0;
	int flag;
	if(scanf("%d-%d-%d",&year,&month,&day) < 3)
	{
		printf("the data is error\n");
		return -1;
	}
	
	if(day < 1 || day > 31)
	{
		printf("all day is error\n");
		return -1;
	}
	
	if(day > 30)
	{
		if(month == 4 || month == 6 || month == 9 || month == 11)
		{
			printf("the day of month 4 6 9 11 is error\n ");
			return -1;
		}
	}

	if(year % 4 == 0 && year % 100 != 0 || year % 400 == 0)
		flag = 1;
	else 
		flag = 0;
	
	if(month == 2 && flag == 0)
	{
		if(day > 28)
		{
			printf("平年2月份出错\n");
			return -1;
		}
	}
	if(month == 2 && flag == 1)
	{
		if(day > 29)
		{
			printf("闰年2月份出错\n");
			return -1;
		}
	}


	switch(month)
	{
	case 12:
		sum += 30;
	case 11:
		sum += 31;
	case 10:
		sum += 30;
	case 9:
		sum += 31;
	case 8:
		sum += 31;
	case 7:
		sum += 30;
	case 6:
		sum += 31;
	case 5:
		sum += 30;
	case 4:
		sum += 31;
	case 3:
		sum += 28 + flag;
	case 2:
		sum += 31;
	case 1:
		sum += day;
		break;
	default:
		printf("the month input error\n");
		return -1;
	}

	printf("%d\n",sum);
	return 0;
}
