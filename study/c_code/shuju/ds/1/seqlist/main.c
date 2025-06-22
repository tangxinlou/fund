#include "head.h"

int main(int argc, const char *argv[])
{
	seqlist *l;
	//给顺序表分配空间。
	l = create_empty_seqlist();

	int i;
	int data;
	for(i = 0;i < 10;i ++)
	{
		scanf("%d",&data);
		//插入元素
		insert_data(l,data);
	}
	
//	insert_assign_data(l,100,2);
	
//	delete_assign_data(l,4);//删除表中指定为4的数据
	print_data(l);
	
	int count;
	count = find_data(l,4);//找出所有值为4的元素下标
	printf("下标为:");
	for(i = 0;i < count;i ++)
	{
		printf("%d ",num[i]);
	}
	printf("\n");
	return 0;
}
