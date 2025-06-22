#include<stdio.h>
#include<stdlib.h>
typedef struct node 
{
	int data;
	struct node *next;

}linkloop;

linkloop *create_empty_loop()
{
	linkloop *head;

	head = (linkloop *)malloc(sizeof(linkloop));

	head->next = head;

	return head;
}

int insert_data(linkloop *head,int data)
{
	linkloop *temp;

	temp = (linkloop *)malloc(sizeof(linkloop));

	temp->data = data;

	temp->next = head->next;
	head->next = temp;

	return 0;
}

int print_data(linkloop *head)
{
	linkloop *p = head->next;

	while(p != head)
	{
		printf("%d ",p->data);
		p = p->next;
	}
	printf("\n");
	return 0;
}

int main(int argc, const char *argv[])
{
	linkloop *head;

	head = create_empty_loop();

	int i;
	for(i = 0;i < 5;i ++)
	{
		insert_data(head,i);
	}
	
	print_data(head);
	return 0;
}
