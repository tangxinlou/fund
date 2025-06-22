#include<stdio.h>
#include<stdlib.h>

#define MAX 100

typedef struct 
{
	int buf[MAX];
	int top;
}seqstack;

seqstack *create_empty_seqstack()
{
	seqstack *s;

	s = (seqstack *)malloc(sizeof(seqstack));

	s->top = -1;

	return s;
}

int is_stack_full(seqstack *s)
{
	return s->top == MAX - 1 ? 1 : 0;
}

int push_stack(seqstack *s,int data)
{
#if 0
	if(s->top == MAX - 1)
	{
		printf("the stack is full\n");
		return -1;
	}
#endif 
	
	if(is_stack_full(s))
	{
		printf("the stack is full\n");
		return -1;
	}

	s->top ++;
	s->buf[s->top] = data;

	return 0;
}

int is_stack_empty(seqstack *s)
{
	return s->top == -1 ? 1 : 0;
}

int pop_stack(seqstack *s)
{
#if 0
	if(s->top == -1)
	{
		printf("the stack is empty\n");
		return -1;
	}
#endif
	
	if(is_stack_empty(s))
	{
		printf("the stack is empty\n");
		return -1;
	}

	int value;

	value = s->buf[s->top];
	s->top --;

	return value;
}

int main(int argc, const char *argv[])
{
	seqstack *s;

	s = create_empty_seqstack();

	int i;
	for(i = 1;i <= 5;i ++)
	{
		push_stack(s,i);
	}

//	while(s->top != -1)
	while(is_stack_empty(s) == 0)
	{
		printf("%d ",pop_stack(s));
	}
	printf("\n");
	
	return 0;
}
