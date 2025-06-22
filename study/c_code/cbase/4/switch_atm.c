#include<stdio.h>

int main(int argc, const char *argv[])
{
	int select,del_select;
	int total_money = 1000;
	int add_money;
	int del_money;
	while(1)
	{
		printf("***************************\n");
		printf("1.查询 2.存款 3.取款 0.退卡\n");
		printf("***************************\n");

		scanf("%d",&select);
		switch(select)
		{
		case 1:
			printf("total_money:%d\n",total_money);	
			break;

		case 2:
			printf("请输入存款金额:");
			scanf("%d",&add_money);
			if(add_money % 50 != 0)
			{
				printf("ATM只接收50或100面额\n");
				continue;
			}
			total_money += add_money;
			printf("存款成功\n");
			break;

		case 3:
#if 0
			printf("请输入取款金额:");
			scanf("%d",&del_money);

			total_money -= del_money;
			printf("取款成功\n");
#endif
			printf("***************************\n");
			printf("选择1.100 2.200 3.500 4.1000 5.自定义\n");
			printf("***************************\n");
			scanf("%d",&del_select);
			switch(del_select)
			{
			case 1:
				if(total_money < 100)
				{
					printf("金额不足\n");
					continue;
				}
				total_money -= 100;
				break;
			case 2:
				if(total_money < 200)
				{
					printf("金额不足\n");
					continue;
				}

				total_money -= 200;
				break;
			case 3:
				if(total_money < 500)
				{
					printf("金额不足\n");
					continue;
				}

				total_money -= 500;
				break;
			case 4:
				if(total_money < 1000)
				{
					printf("金额不足\n");
					continue;
				}

				total_money -= 1000;
				break;
			case 5:
				printf("请输入需要的取款金额:");
				scanf("%d",&del_money);
				if(del_money > total_money)
				{
					printf("金额不足\n");
					continue;
				}
				if(del_money % 50 != 0)
				{
					printf("只支持50或100面额\n");
					continue;
				}
				total_money -= del_money;
				break;
			}
			printf("取款成功\n");
			break;
		case 0:
			printf("请选择是否退卡:yes是退出 no不退出\n");
			char choice[5];
			scanf("%s",choice);

			if(strcmp(choice,"yes") == 0)
			{
				printf("退卡成功\n");
				return 0;
			}
			if(strcmp(choice,"no") == 0)
			{
				printf("继续操作\n");
				continue;
			}
		}

	}
	return 0;
}
