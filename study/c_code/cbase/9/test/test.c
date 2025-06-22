#include "head.h"
#include "head.h"

void input_info(struct stu *p)
{
	printf("name\tID\tAGE\tSCORE\n");

	int i;
	for(i = 0;i < 3;i ++)
	{
		scanf("%s%d%d%d",(p + i)->name,&(p + i)->id,&(p + i)->age,&(p + i)->score);
	}
}

void sort_info(struct stu *p)
{
	int i,j;
	
	struct stu temp;
	for(i = 0;i < 2;i ++)
	{
		for(j = 0;j < 2 - i;j ++)
		{
			if((p + j)->score < (p + j + 1)->score)
			{
				temp = p[j];
				p[j] = p[j + 1];
				p[j + 1] = temp;
			}
		}
	}
}

void output_info(struct stu *p)
{
	printf("*****华丽的分割线*****\n");
	int i;
	for(i = 0;i < 3;i ++)
	{
		printf("%s\t%d\t%d\t%d\n",(p + i)->name,(p + i)->id,(p + i)->age,(p + i)->score);
	}

}


