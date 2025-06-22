#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main(int argc, const char *argv[])
{
	if(argc < 2)
	{
		printf("input error\n");
		return -1;
	}
	int sockfd;
	
	sockfd = socket(AF_INET,SOCK_STREAM,0);
	if(sockfd == -1)
	{

	}

	struct sockaddr_in seraddr,cliaddr;

	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(atoi(argv[1]));
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.218");
	
	int on = 1;
	setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR,&on,sizeof(on));

	if(bind(sockfd,(struct sockaddr *)&seraddr,sizeof(seraddr)) == -1)
	{
		perror("bind");
		return -1;
	}
	
	printf("1\n");
	if(listen(sockfd,5) == -1)
	{
		perror("listen");
		return -1;
	}
	printf("2\n");
	int connfd;
	socklen_t len = sizeof(cliaddr);
	connfd = accept(sockfd,(struct sockaddr *)&cliaddr,&len);
	printf("3\n");
	if(connfd == -1)
	{
		perror("accept");
		return -1;
	}

	char buf[10];
	recv(connfd,buf,sizeof(buf),0);
	printf("%s\n",buf);
	close(connfd);
	close(sockfd);
	return 0;
}
