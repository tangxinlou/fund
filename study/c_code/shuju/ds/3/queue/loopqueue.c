#include<stdio.h>
#include<stdlib.h>

#define MAX 100

typedef struct 
{
	int buf[MAX];
	int front;
	int rear;
}loopqueue;

loopqueue *create_empty_queue()
{
	loopqueue *q;

	q = (loopqueue *)malloc(sizeof(loopqueue));

	q->front = q->rear = 0;

	return q;
}

int is_queue_full(loopqueue *q)
{
	return (q->rear + 1) % MAX == q->front ? 1 : 0;
}

int enter_queue(loopqueue *q,int data)
{
	//判满
	if(is_queue_full(q))
	{
		printf("the queue is full\n");
		return -1;
	}

	q->buf[q->rear] = data;
	q->rear = (q->rear + 1) % MAX;

	return 0;
}

int is_queue_empty(loopqueue *q)
{
	return q->front == q->rear ? 1 : 0;
}

int out_queue(loopqueue *q)
{
	if(is_queue_empty(q))
	{
		printf("the queue is empty\n");
		return -1;
	}

	int value;

	value = q->buf[q->front];
	q->front = (q->front + 1) % MAX;

	return value;
}

int main(int argc, const char *argv[])
{
	loopqueue *q;

	q = create_empty_queue();

	int i;

	for(i = 1;i <= 5;i ++)
	{
		enter_queue(q,i);
	}

	//当队列不为空时执行循环
	while(!is_queue_empty(q))
	{
		printf("%d ",out_queue(q));
	}
	printf("\n");
	return 0;
}
