#include<stdio.h>
#include<stdlib.h>

typedef int DATATYPE;

typedef struct node 
{
	DATATYPE data;
	struct node *next;
}linklist;

linklist *create_empty_linklist()
{
	linklist *head;


	head = (linklist *)malloc(sizeof(linklist));

	head->next = NULL;//当前创建出来的节点后续没有其他节点

	return head;
}

int insert_data_by_head(linklist *head,DATATYPE data)
{
	linklist *temp;

	temp = (linklist *)malloc(sizeof(linklist));
	temp->data = data;

//  错误演示
//	head->next = temp;
//	temp->next = NULL;
	
	temp->next = head->next;
	head->next = temp;

	return 0;
}

int insert_data_by_tail(linklist *head,DATATYPE data)
{
	linklist *p = head;
	linklist *temp;

	while(p->next != NULL)
		p = p->next;

	temp = (linklist *)malloc(sizeof(linklist));
	temp->data = data;

	p->next = temp;
	temp->next = NULL;

	return 0;
}

int print_data(linklist *head)
{
	linklist *p = head->next;//跳过头节点、头节点中没有数据

	while(p != NULL)
	{
		printf("%d ",p->data);
		p = p->next;
	}
	printf("\n");
	return 0;
}

linklist *find_assign_data(linklist *head,DATATYPE data)
{
	linklist *p = head->next;

	while(p != NULL)
	{
		if(p->data != data)
			p = p->next;
		else 
			return p;
	}
}

linklist *find_data_by_num(linklist *head,int num)
{
	linklist *p = head;
	int i = 1;
	if(num == 0)
		return head;

	while(p->next != NULL)
	{
		if(i <= num)
		{
			p = p->next;
			i ++;
		}
		else 
			return p;
	}
	
}

int insert_data_anywhere(linklist *head,int post,DATATYPE data)
{
	linklist *p;
	linklist *temp;

	p = find_data_by_num(head,post - 1);//目的是寻找post对应节点的前一个节点地址
	
	temp = (linklist *)malloc(sizeof(linklist));
	temp->data = data;

	temp->next = p->next;
	p->next = temp;

	return 0;
}

int delete_assign_post_data(linklist *head,int post)
{
	//要删除一个元素，必须先获取它的前面节点的地址
	linklist *p;

	p = find_data_by_num(head,post - 1);

	linklist *temp;

	if(p != NULL && p->next != NULL)
	{
		temp = p->next;
		p->next = temp->next;

		free(temp);
		temp = NULL;
	}

	return 0;
}

void exchange_data(linklist *head)
{
	linklist *p = head->next;

	linklist *cur = p->next;	
	p->next = NULL;

	while(cur != NULL)
	{
		p = cur->next;
		cur->next = head->next;
		head->next = cur;
		cur = p;
	}
}

void cleanup_linklist(linklist *head)

{
	linklist *p = head;
	linklist *temp;

	while(p)
	{
		temp = p;
		free(temp);
		temp = NULL;

		p = p->next;
	}
}

int main(int argc, const char *argv[])
{
	linklist *head;

	head = create_empty_linklist();

	int i;
	int data;
	for(i = 0;i < 5;i ++)
	{
		scanf("%d",&data);
//		insert_data_by_head(head,data);//头插法
		insert_data_by_tail(head,data);//尾插法
	}

//	printf("%d\n",head->next->data);
//	printf("%d\n",head->next->next->data);

//	print_data(head);
	
//	linklist *p;
	//查找元素值为4的节点首地址
//	p = find_assign_data(head,4);
//	printf("%d\n",p->data);
	
	//查找链表中第四个节点,头算第0个
//	p = find_data_by_num(head,4);
//	printf("%d\n",p->data);
	
	//如何事先按照任意位置插入元素
//	insert_data_anywhere(head,3,100);//在第三个位置插入元素100
//	print_data(head);
	
	//删除指定位置元素
//	delete_assign_post_data(head,3);//删除第三个位置的元素	
//	print_data(head);
	
	exchange_data(head);
	print_data(head);

//	cleanup_linklist(head);
//	print_data(head);
	return 0;
}
