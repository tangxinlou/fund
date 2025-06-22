#include<stdio.h>

typedef struct node 
{
	int data;
	struct node *next;
	struct node *prev;
}linkloop;

linkloop *create_empty_bothway()
{
	linkloop *head;

	head = (linkloop *)malloc(sizeof(linkloop));

	head->next = head;
	head->prev = head;

	return head;
}

int main(int argc, const char *argv[])
{
	linkloop *head;

	head = create_empty_bothway();
	
	return 0;
}
