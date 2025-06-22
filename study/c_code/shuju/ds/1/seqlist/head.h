#ifndef _HEAD_H
#define _HEAD_H

#include<stdio.h>
#include<stdlib.h>

int num[100];

#define MAX 100
typedef int DATATYPE;

typedef struct 
{
	DATATYPE buf[MAX];
	int n;//代表了数组下标
}seqlist;

extern seqlist *create_empty_seqlist();
extern int insert_data(seqlist *l,DATATYPE data);
extern void print_data(seqlist *l);
extern int insert_assign_data(seqlist *l,DATATYPE data,int post);
extern int delete_assign_data(seqlist *l,DATATYPE data);
extern int find_data(seqlist *l,DATATYPE data);
#endif
