#include<stdio.h>
#include<stdlib.h>

struct node 
{
	int data;
	struct node *next;
};

typedef struct 
{
	struct node *top;
}linkstack;

linkstack *create_empty_linkstack()
{
	linkstack *s;

	s = (linkstack *)malloc(sizeof(linkstack));
	s->top = NULL;

	return s;
}

int push_stack(linkstack *s,int data)
{
	struct node *temp;

	temp = (struct node *)malloc(sizeof(struct node));
	temp->data = data;

	temp->next = s->top;
	s->top = temp;

	return 0;
}

int pop_stack(linkstack *s)
{
	if(s->top == NULL)
	{
		printf("the stack is empty\n");
		return -1;
	}

	struct node *temp;
	int value;

	temp = s->top;
	s->top = temp->next;
	value = temp->data;
	free(temp);

	return value;
}

int main(int argc, const char *argv[])
{
	linkstack *s;

	s = create_empty_linkstack();

	int i;

	for(i = 0;i < 5;i ++)
	{
		push_stack(s,i);
	}

	while(s->top != NULL)
	{
		printf("%d ",pop_stack(s));
	}
	printf("\n");
	return 0;
}
