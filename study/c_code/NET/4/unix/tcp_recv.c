#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>
#include<stdlib.h>
#include<sys/un.h>
int main(int argc, const char *argv[])
{
	int sockfd,connfd;//sockfd叫做监听套接字   connfd连接套接字

	if((sockfd = socket(AF_UNIX,SOCK_STREAM,0)) == -1)
	{
		perror("socket");
		exit(1);
	}

	struct sockaddr_un seraddr,cliaddr;//man 7 unix
	char buf[64];

	memset(&seraddr,0,sizeof(seraddr));
	seraddr.sun_family = AF_UNIX;
	strcpy(seraddr.sun_path,"./mysocket");//套接字文件用过后一定要删除

	int len = sizeof(seraddr.sun_family) + strlen(seraddr.sun_path);
	if(bind(sockfd,(struct sockaddr *)&seraddr,len) == -1)
	{
		perror("bind");
		exit(1);
	}

	if(listen(sockfd,5) == -1)
	{
		perror("listen");
		exit(1);
	}
	int cli_len = sizeof(cliaddr);
	int n;

	if((connfd = accept(sockfd,(struct sockaddr *)&cliaddr,&cli_len)) == -1)
	{
		perror("accept");
		exit(1);
	}

	printf("*******\n");
	while(1)
	{
#if 1
		if((n = recv(connfd,buf,sizeof(buf),0)) == -1)
		{
			perror("recv");
			exit(1);
		}
#endif 
		
		buf[n - 1] = '\0';
		printf("%s\n",buf);
	}
	close(connfd);
	close(sockfd);
	return 0;
}
