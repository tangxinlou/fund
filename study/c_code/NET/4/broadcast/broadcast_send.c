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
	
	struct sockaddr_in broadaddr;
	sockfd = socket(AF_INET,SOCK_DGRAM,0);
	if(sockfd == -1)
	{
		perror("socket");
		return -1;
	}

	broadaddr.sin_family = AF_INET;
	broadaddr.sin_port = htons(50000);
	broadaddr.sin_addr.s_addr = inet_addr("192.168.199.255");

	int on = 1;
	setsockopt(sockfd,SOL_SOCKET,SO_BROADCAST,&on,sizeof(on));

	char buf[10];
	while(1)
	{
		fgets(buf,sizeof(buf),stdin);
		buf[strlen(buf) - 1] = '\0';//去掉\n
		sendto(sockfd,buf,strlen(buf),0,(const struct sockaddr *)&broadaddr,sizeof(broadaddr));

	}
	return 0;
}
