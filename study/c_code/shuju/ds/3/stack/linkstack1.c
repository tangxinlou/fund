#include<stdio.h>
#include<stdlib.h>

struct node   （不用掌握）
{
	int data;
	struct node *next;
};

struct node *top = NULL;

int push_stack(int data)
{
	struct node *temp;

	temp = (struct node *)malloc(sizeof(struct node));
	temp->data = data;

	temp->next = top;
	top = temp;

	return 0;
}

int pop_stack()
{
	if(top == NULL)
	{
		printf("empty\n");
		return -1;
	}

	struct node *temp;
	int value;

	temp = top;
	top = temp->next;
	value = temp->data;
	free(temp);

	return value;
}

int main(int argc, const char *argv[])
{

	int i;

	for(i = 0;i < 5;i ++)
		push_stack(i);
	
	while(top != NULL)
	{
		printf("%d ",pop_stack());
	}
	printf("\n");
	return 0;
}
