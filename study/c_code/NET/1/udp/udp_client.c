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
	seraddr.sin_port = htons(50031);
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.218");
	
	char buf[10];
	char buff[100];
	socklen_t len = sizeof(seraddr);
	while(1)
	{
		fgets(buf,sizeof(buf),stdin);
		buf[strlen(buf) - 1] = '\0';//去掉\n
		sendto(sockfd,buf,strlen(buf),0,(const struct sockaddr *)&seraddr,sizeof(seraddr));

		recvfrom(sockfd,buff,100,0,(struct sockaddr *)&seraddr,&len);
		printf("recv from server:%s:%d:%s\n",inet_ntoa(seraddr.sin_addr),ntohs(seraddr.sin_port),buff);
	}
	return 0;
}
