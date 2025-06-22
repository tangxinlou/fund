#include "head.h"

int is_queue_return(linkqueue *q)//如果返回值为0说明队列没还原，如果返回值为1说明队列还原了
{
	struct node *p = q->front->next;//队列中头节点后面的第一个节点
	int i;

	for(i = 1;i <= 27;i ++)
	{
		if(p->data != i)
			return 0;
		else 
			p = p->next;
	}
	return 1;
}

int ball_time(linkqueue *q,linkstack *min,linkstack *fmin,linkstack *hour)
{
	int ball;
	int count = 0;
	while(1)
	{
		ball = out_queue(q);//将球出队

		if(min->n < 4)//1分钟的栈没有满
		{
			push_stack(min,ball);
			continue;
		}

		while(!is_stack_empty(min))
		{
			enter_queue(q,pop_stack(min));
		}

		if(fmin->n < 11)
		{
			push_stack(fmin,ball);
			continue;
		}

		while(!is_stack_empty(fmin))
		{
			enter_queue(q,pop_stack(fmin));
		}
		
		if(hour->n < 11)
		{
			push_stack(hour,ball);
			continue;
		}

		while(!is_stack_empty(hour))
		{
			enter_queue(q,pop_stack(hour));
		}

		enter_queue(q,ball);//执行到这里已经正好过了12个小时

		count ++;
		if(is_queue_return(q) == 1)
			break;
	}

	return count / 2;
}

int main(int argc, const char *argv[])
{
	linkqueue *q;
	linkstack *min,*fmin,*hour;

	q = create_empty_queue();

	min = create_empty_linkstack();
	fmin = create_empty_linkstack();
	hour = create_empty_linkstack();

	//将球编号为1-27循环入队
	int i;

	for(i = 1;i <= 27;i ++)
	{
		enter_queue(q,i);
	}
	
	int days;
	days = ball_time(q,min,fmin,hour);
	printf("days:%d\n",days);
	return 0;
}
