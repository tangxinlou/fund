#ifndef _HEAD_UDP_
#define _HEAD_UDP_

#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netinet/ip.h>
#include<arpa/inet.h>
#include<string.h>
#include<stdlib.h>
#include<signal.h>

struct msg
{
	char type;
	char name[15];
	char buf[64];
};

typedef struct node 
{
	struct sockaddr_in data;
	struct node *next;
}linklist;

extern linklist *create_empty_linklist();
extern int user_login(linklist *head,struct sockaddr_in data,int sockfd,struct msg info);
extern int user_sendmsg(linklist *head,struct sockaddr_in data,int sockfd,struct msg info);
extern int user_exit(linklist *head,struct sockaddr_in data,int sockfd,struct msg info);

#endif
