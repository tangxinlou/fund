#include "head.h"
int main(int argc, const char *argv[])
{
	int sockfd;
	pid_t pid;
	sockfd = socket(AF_INET,SOCK_DGRAM,0);
	if(sockfd == -1)
	{
		perror("socket");
		return -1;
	}

	struct sockaddr_in seraddr;
	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(50000);
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.195");

	struct msg info;

	printf("input name:");
	fgets(info.name,sizeof(info.name),stdin);
	info.name[strlen(info.name) - 1] = '\0';
	info.type = 'L';
	sendto(sockfd,&info,sizeof(info),0,(struct sockaddr *)&seraddr,sizeof(seraddr));

	pid = fork();
	if(pid == -1)
	{
		perror("fork");
		return -1;
	}
	else if(pid == 0)
	{
		while(1)
		{
			printf("please speak:");
			memset(info.buf,0,sizeof(info.buf));
			fgets(info.buf,sizeof(info.buf),stdin);
			info.buf[strlen(info.buf) - 1] = '\0';

			if(strncmp(info.buf,"quit",4) == 0)
			{
				info.type = 'Q';
				sendto(sockfd,&info,sizeof(info),0,(struct sockaddr *)&seraddr,sizeof(seraddr));
				kill(getppid(),SIGKILL);
				exit(EXIT_SUCCESS);
			}
			else 
			{
				info.type = 'S';
				sendto(sockfd,&info,sizeof(info),0,(struct sockaddr *)&seraddr,sizeof(seraddr));
			}
		}
	}
	else 
	{
		while(1)
		{
			recvfrom(sockfd,&info,sizeof(info),0,NULL,NULL);
			switch(info.type)
			{
			case 'L':
				printf("login:%s\n",info.name);
				break;
			case 'S':
				printf("%s said:%s\n",info.name,info.buf);
				break;
			case 'Q':
				printf("%s exit\n",info.name);
				break;
			}
		}
	}

	return 0;
}
