#include<stdio.h>
#include<stdlib.h>

typedef struct bitree
{
	int data;
	struct bitree *lchild;
	struct bitree *rchild;
}bitree_t;

struct node 
{
	bitree_t *data;
	struct node *next;
};

typedef struct 
{
	struct node *front;
	struct node *rear;
}linkqueue;

bitree_t *create_bitree(int num,int max)
{
	bitree_t *curnode;
	
	if(num > max)//递归的退出条件
		return NULL;

	curnode = (bitree_t *)malloc(sizeof(bitree_t));
	curnode->data = num;

	curnode->lchild = create_bitree(2 * num,max);
	curnode->rchild = create_bitree(2 * num + 1,max);

	return curnode;
}

int pre_traverse(bitree_t *curnode)
{
	if(curnode == NULL)
	{
		return -1;
	}

	printf("%d ",curnode->data);
	
	pre_traverse(curnode->lchild);
	pre_traverse(curnode->rchild);
	return 0;
}

int mid_traverse(bitree_t *curnode)
{
	if(curnode == NULL)
		return -1;

	mid_traverse(curnode->lchild);
	printf("%d ",curnode->data);
	mid_traverse(curnode->rchild);
	return 0;
}

int last_traverse(bitree_t *curnode)
{
	if(curnode == NULL)
		return -1;

	last_traverse(curnode->lchild);
	last_traverse(curnode->rchild);
	printf("%d ",curnode->data);
}

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

int enter_queue(linkqueue *q,bitree_t *curnode)
{
	struct node *temp;

	temp = (struct node *)malloc(sizeof(struct node));
	temp->data = curnode;

	q->rear->next = temp;
	temp->next = NULL;
	q->rear = temp;

	return 0;
}

int is_queue_empty(linkqueue *q)
{
	return q->front == q->rear ? 1 : 0;
}

bitree_t *out_queue(linkqueue *q)
{
	if(is_queue_empty(q))
	{
		printf("empty\n");
		return NULL;
	}

	struct node *temp;

	temp = q->front;
	q->front = temp->next;

	free(temp);

	return q->front->data;
}

int lelvel_traverse(bitree_t *curnode)
{
	linkqueue *q;

	q = create_empty_queue();

	enter_queue(q,curnode);

	while(!is_queue_empty(q))
	{
		curnode = out_queue(q);
		printf("%d ",curnode->data);

		if(curnode->lchild != NULL)
			enter_queue(q,curnode->lchild);
		if(curnode->rchild != NULL)
			enter_queue(q,curnode->rchild);
	}
}

int main(int argc, const char *argv[])
{
	bitree_t *curnode;
#if 0	
	申请一个空间作为某个节点的首地址
	数据赋值

	给左孩子申请空间
	赋值

	给右孩子申请空间
	赋值
	bitree_t *root;

	root = (bitree_t *)malloc(sizeof(bitree_t));
	root->data = 1;

	//p代表左孩子地址
	p = malloc(sizeof(bitree_t));
	p->data = 2;
	{
		//q是p的左孩子
		p->lchild = malloc(sizeof(bitree_t));
		q->data = 数值
		//x是p的右孩子
		p->rchild = malloc(sizeof(bitree_t));
		x->data = 数值
	}
	//代表根的右孩子
	pr = malloc(sizeof(bitree_t));
	pr->data = 数值;
	{
		pr->lchild = malloc();

		pr->rchild = malloc();
	}

#endif
	curnode = create_bitree(1,6);//完全二叉树的初始编号是1，一共有6个节点

	pre_traverse(curnode);
	printf("\n");

	mid_traverse(curnode);
	printf("\n");

	last_traverse(curnode);
	printf("\n");

	lelvel_traverse(curnode);
	printf("\n");
	return 0;
}
