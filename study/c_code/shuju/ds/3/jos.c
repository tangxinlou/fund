#include<stdio.h>
#include<stdlib.h>

typedef struct node 
{
	int data;
	struct node *next;

}jos_t;

jos_t *create_empty_jos()
{
	jos_t *head;

	head = (jos_t *)malloc(sizeof(jos_t));
	head->data = 1;
	head->next = head;

	return head;
}

int insert_data(jos_t *head,int data)
{
	jos_t *temp;

	temp = (jos_t *)malloc(sizeof(jos_t));
	temp->data = data;

	temp->next = head->next;
	head->next = temp;

	return 0;
}

int print_jos(jos_t *head,int k)
{
	jos_t *p = head;
	jos_t *temp;
	int i = 1;

	while(p->next != p)
	{
		while(i <= k - 2)//循环出去时指向了要删除的前一个节点
		{
			p = p->next;
			i ++;
		}

		temp = p->next;
		p->next = temp->next;

		printf("%d ",temp->data);
		free(temp);

		i = 0;
	}
	printf("%d\n",p->data);
}

int main(int argc, const char *argv[])
{
	jos_t *head;

	head = create_empty_jos();

	int i;

	for(i = 7;i >= 2;i --)
		insert_data(head,i);

	print_jos(head,3);	
	return 0;
}
