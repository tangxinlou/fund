#include "head.h"

linkstack *create_empty_linkstack()
{
	linkstack *s;

	s = (linkstack *)malloc(sizeof(linkstack));
	s->top = NULL;
	s->n = 0;

	return s;
}

int push_stack(linkstack *s,int data)
{
	struct node *temp;

	temp = (struct node *)malloc(sizeof(struct node));
	temp->data = data;

	temp->next = s->top;
	s->top = temp;
	s->n ++;

	return 0;
}

int is_stack_empty(linkstack *s)
{
	return s->top == NULL ? 1 : 0;
}

int pop_stack(linkstack *s)
{
	if(is_stack_empty(s))
	{
		printf("the stack is empty\n");
		return -1;
	}

	struct node *temp;
	int value;

	temp = s->top;
	s->top = temp->next;
	s->n --;
	value = temp->data;
	free(temp);

	return value;
}


