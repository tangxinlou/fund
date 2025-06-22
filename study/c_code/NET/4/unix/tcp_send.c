#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<stdlib.h>
#include<string.h>
#include<sys/un.h>

int main(int argc, const char *argv[])
{
	int sockfd;

	if((sockfd = socket(AF_UNIX,SOCK_STREAM,0)) == -1)
	{
		perror("socket");
		exit(1);
	}

	struct sockaddr_un seraddr;
	memset(&seraddr,0,sizeof(seraddr));
	seraddr.sun_family = AF_UNIX;
	strcpy(seraddr.sun_path,"./mysocket");

	int len = sizeof(seraddr.sun_family) + strlen(seraddr.sun_path);
	if(connect(sockfd,(struct sockaddr *)&seraddr,len) == -1)
	{
		perror("connect");
		exit(1);
	}
	char buf[64];
	while(1)
	{
		fgets(buf,sizeof(buf),stdin);
		buf[strlen(buf) - 1] = '\0';
		
		if(strncmp(buf,"quit",4) == 0)
			break;

		send(sockfd,buf,strlen(buf) + 1,0);
	}
	close(sockfd);
	return 0;
}
