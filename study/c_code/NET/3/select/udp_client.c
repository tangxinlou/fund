#include<stdio.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netinet/ip.h>
#include<string.h>
#include<sys/types.h>
#include<arpa/inet.h>

int main(int argc, const char *argv[])
{
	int sockfd;
	
	struct sockaddr_in seraddr;
	sockfd = socket(AF_INET,SOCK_DGRAM,0);
	if(sockfd == -1)
	{
		perror("socket");
		return -1;
	}

	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(50000);
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.195");
	
	char buf[64];
	char buff[100];
	socklen_t len = sizeof(seraddr);
	while(1)
	{
		fgets(buf,sizeof(buf),stdin);
		buf[strlen(buf) - 1] = '\0';//去掉\n
		sendto(sockfd,buf,strlen(buf),0,(const struct sockaddr *)&seraddr,sizeof(seraddr));

	}
	return 0;
}
