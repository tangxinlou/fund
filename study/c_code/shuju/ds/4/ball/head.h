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
	int n;//专门计数
}linkstack;

extern linkstack *create_empty_linkstack();
extern int push_stack(linkstack *s,int data);
extern int is_stack_empty(linkstack *s);
extern int pop_stack(linkstack *s);


typedef struct 
{
	struct node *front;
	struct node *rear;
}linkqueue;

extern linkqueue *create_empty_queue();
extern int enter_queue(linkqueue *q,int data);
extern int is_queue_empty(linkqueue *q);
extern int out_queue(linkqueue *q);
