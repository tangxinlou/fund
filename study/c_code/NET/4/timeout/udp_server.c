#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netinet/ip.h>
#include<arpa/inet.h>
#include<string.h>
#include<errno.h>

int main(int argc, const char *argv[])
{
	int sockfd;

	sockfd = socket(AF_INET,SOCK_DGRAM,0);
	if(sockfd == -1)
	{

	}

	struct sockaddr_in seraddr,cliaddr;

	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(50000);
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.195");

	if(bind(sockfd,(const struct sockaddr *)&seraddr,sizeof(seraddr)) == -1)
	{
		perror("bind");
		return -1;
	}

	char buf[10];
	socklen_t len = sizeof(cliaddr);
	ssize_t n;
	
	struct timeval tl;
	tl.tv_sec = 3;
	tl.tv_usec = 0;
	setsockopt(sockfd,SOL_SOCKET,SO_RCVTIMEO,&tl,sizeof(tl));

	while(1)
	{
		memset(buf,0,10);//给指定空间的指定大小置为某个具体值
		//bzero(buf,10);//专门清零
		n = recvfrom(sockfd,buf,sizeof(buf),0,(struct sockaddr *)&cliaddr,&len);
		if(n == -1)
		{
			if(errno == EAGAIN)
			{
				printf("time out\n");
				continue;
			}
			else 
			{
				perror("recvfrom");
				return -1;
			}
		}

		printf("recv from %s:%d %s\n",inet_ntoa(cliaddr.sin_addr),ntohs(cliaddr.sin_port),buf);

		sendto(sockfd,"i am server",12,0,(const struct sockaddr *)&cliaddr,sizeof(cliaddr));
	}
	return 0;
}
