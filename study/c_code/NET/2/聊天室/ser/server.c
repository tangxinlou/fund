#include "head.h"

linklist *create_empty_linklist()
{
	linklist *head;

	head = (linklist *)malloc(sizeof(linklist));

	head->next = NULL;

	return head;
}

int user_login(linklist *head,struct sockaddr_in data,int sockfd,struct msg info)
{
	linklist *temp;

	temp = (linklist *)malloc(sizeof(linklist));
	temp->data = data; 

	temp->next = head->next;
	head->next = temp;
	
	linklist *p = head->next;

	while(p != NULL)
	{
		if(memcmp(&p->data,&data,sizeof(data)) != 0)
			sendto(sockfd,&info,sizeof(info),0,(struct sockaddr *)&p->data,sizeof(p->data));
		p = p->next;
	}

	return 0;
}

int user_sendmsg(linklist *head,struct sockaddr_in data,int sockfd,struct msg info)
{
	linklist *p = head->next;

	while(p != NULL)
	{
		if(memcmp(&p->data,&data,sizeof(data)) != 0)
			sendto(sockfd,&info,sizeof(info),0,(struct sockaddr *)&p->data,sizeof(p->data));
		p = p->next;
	}
}

int user_exit(linklist *head,struct sockaddr_in data,int sockfd,struct msg info)
{
	linklist *p = head;
	linklist *temp;
	while(p->next != NULL)
	{
		if(memcmp(&p->next->data,&data,sizeof(data)) == 0)
		{
			temp = p->next;
			p->next = temp->next;

			free(temp);
			temp = NULL;
		}
		else 
		{
			sendto(sockfd,&info,sizeof(info),0,(struct sockaddr *)&p->next->data,sizeof(p->next->data));
			p = p->next;
		}
	}
}


