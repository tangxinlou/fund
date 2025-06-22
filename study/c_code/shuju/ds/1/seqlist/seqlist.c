#include "head.h"
seqlist *create_empty_seqlist()
{
	seqlist *l;

	l = (seqlist *)malloc(sizeof(seqlist));
	if(l == NULL)
	{
		printf("create_empty_seqlist error\n");
		return NULL;
	}
	
	l->n = -1;

	return l;
}

int insert_data(seqlist *l,DATATYPE data)
{
	if(l->n > MAX)	
	{
		printf("data input error\n");
		return -1;
	}

	l->n ++;//先使n变成0
	l->buf[l->n] = data;

	return 0;
}

void print_data(seqlist *l)
{
	int i;

	for(i = 0;i <= l->n;i ++)
	{
		printf("%d ",l->buf[i]);
	}
	printf("\n");
}

int insert_assign_data(seqlist *l,DATATYPE data,int post)
{
	int move;

	move = l->n + 1 - post + 1;

	int i;
	i = l->n;

	for(;move > 0;move --)
	{
		l->buf[i + 1] = l->buf[i];
		i --;
	}

	l->buf[post - 1] = data;
	l->n ++;

	return 0;
}

int delete_assign_data(seqlist *l,DATATYPE data)
{
	int i;
	int j = 0;
	for(i = 0;i <= l->n;i ++)
	{
		if(l->buf[i] != data)
		{
			l->buf[j ++] = l->buf[i];
		}
	}
	l->n = j - 1;
	return 0;
}

int find_data(seqlist *l,int data)
{
	int i;
	int j = 0;		
	for(i = 0;i <= l->n;i ++)
	{
		if(l->buf[i] == data)
		{
			num[j ++] = i; 
		}
	}

	return j;
}

