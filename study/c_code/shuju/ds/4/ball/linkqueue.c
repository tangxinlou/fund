#include "head.h"

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
	return q->front == q->rear ? 1 : 0;
}

int out_queue(linkqueue *q)
{
	if(is_queue_empty(q))
	{
		printf("error\n");
		return -1;
	}

	struct node *temp;

	temp = q->front;
	q->front = temp->next;
	free(temp);
	return q->front->data;
}


