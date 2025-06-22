#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netinet/ip.h>
#include<arpa/inet.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	int sockfd;

	sockfd = socket(AF_INET,SOCK_DGRAM,0);
	if(sockfd == -1)
	{

	}

	struct sockaddr_in seraddr,cliaddr;

	seraddr.sin_family = AF_INET;//这里的seraddr代表的就是组播地址信息
	seraddr.sin_port = htons(50000);
	seraddr.sin_addr.s_addr = inet_addr("226.1.2.3");
	
	struct ip_mreqn multiaddr;
	multiaddr.imr_address.s_addr = inet_addr("192.168.199.195");
	multiaddr.imr_multiaddr.s_addr = inet_addr("226.1.2.3");
	multiaddr.imr_ifindex = 0;//网卡编号

	setsockopt(sockfd,IPPROTO_IP,IP_ADD_MEMBERSHIP,&multiaddr,sizeof(multiaddr));//将本机ip加入到一个指定组中

	if(bind(sockfd,(const struct sockaddr *)&seraddr,sizeof(seraddr)) == -1)
	{
		perror("bind");
		return -1;
	}

	char buf[10];
	socklen_t len = sizeof(cliaddr);
	ssize_t n;

	while(1)
	{
		memset(buf,0,10);//给指定空间的指定大小置为某个具体值
		n = recvfrom(sockfd,buf,sizeof(buf),0,(struct sockaddr *)&cliaddr,&len);
		if(n == -1)
		{
			perror("recvfrom");
			return -1;
		}

		printf("recv from %s:%d %s\n",inet_ntoa(cliaddr.sin_addr),ntohs(cliaddr.sin_port),buf);

	}
	return 0;
}
