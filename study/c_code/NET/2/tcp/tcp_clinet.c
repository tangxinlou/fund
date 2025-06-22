#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>

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

	struct sockaddr_in seraddr;

	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(atoi(argv[1]));
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.218");

	if(connect(sockfd,(struct sockaddr *)&seraddr,sizeof(seraddr)) == -1)
	{
		perror("connect");
		return -1;
	}

	send(sockfd,"hello",6,0);

	close(sockfd);
	return 0;
}
