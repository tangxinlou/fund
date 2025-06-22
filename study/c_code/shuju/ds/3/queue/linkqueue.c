#include<stdio.h>
#include<stdlib.h>

struct node 
{
	int data;
	struct node *next;
};

typedef struct 
{
	struct node *front;
	struct node *rear;
}linkqueue;

linkqueue *create_empty_queue()
{
	struct node *head;

	head = (struct node *)malloc(sizeof(struct node));
	head->next = NULL;

	linkqueue *q;
	q = (linkqueue *)malloc(sizeof(linkqueue));
	q->front = q->rear = head;

	return q;
}

int enter_queue(linkqueue *q,int data)
{
	struct node *temp;

	temp = (struct node *)malloc(sizeof(struct node));
	temp->data = data;

	q->rear->next = temp;
	temp->next = NULL;

	q->rear = temp;

	return 0;
}

int is_queue_empty(linkqueue *q)
{
	return q->front->next == NULL ? 1 : 0;
}

int out_queue(linkqueue *q)
{
	if(is_queue_empty(q))
	{
		printf("error\n");
		return -1;
	}

	struct node *temp;

	int value;
	temp = q->front->next;
	q->front->next = temp->next;
	
	value = temp->data;

	free(temp);
	return value;
}

int main(int argc, const char *argv[])
{
	linkqueue *q;

	q = create_empty_queue();

	int i;

	for(i = 1;i <= 5;i ++)
	{
		enter_queue(q,i);
	}
	
	while(!is_queue_empty(q))
	{
		printf("%d ",out_queue(q));
	}
	printf("\n");
	return 0;
}
