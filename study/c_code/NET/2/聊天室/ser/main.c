#include"head.h"

int main(int argc, const char *argv[])
{
	int sockfd;

	sockfd = socket(AF_INET,SOCK_DGRAM,0);
	if(sockfd == -1)
	{
		perror("socket");
		return -1;
	}

	struct sockaddr_in seraddr,cliaddr;

	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(50000);
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.195");

	if(bind(sockfd,(struct sockaddr *)&seraddr,sizeof(seraddr)) == -1)
	{
		perror("bind");
		return -1;
	}
	
	linklist *head;
	head = create_empty_linklist();

	struct msg info;
	int n;
	int len = sizeof(cliaddr);
	while(1)
	{
		n = recvfrom(sockfd,&info,sizeof(info),0,(struct sockaddr *)&cliaddr,&len);
		if(n == -1)
		{
			perror("recvfrom");
			return -1;
		}
		
		switch(info.type)
		{
		case 'L':
			user_login(head,cliaddr,sockfd,info);
			break;
		case 'S':
			user_sendmsg(head,cliaddr,sockfd,info);
			break;
		case 'Q':
			user_exit(head,cliaddr,sockfd,info);
			break;
		}

	}
	return 0;
}
