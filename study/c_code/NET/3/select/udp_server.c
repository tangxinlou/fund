#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<netinet/ip.h>
#include<arpa/inet.h>
#include<string.h>
#include<sys/select.h>

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
	
	fd_set readfds;//定义了一张读表
	FD_ZERO(&readfds);//清空读表


	char buf[64];
	ssize_t n;
	int len = sizeof(cliaddr);
	int maxfd = sockfd + 1;
	int recv_len;
	int i;
	while(1)//udp的多路复用服务器模型——单进程服务器，对比多线程或者多进程服务器要大大的节省资源，但是如果客户端比较多会造成后面客户端反映慢
	{
		FD_SET(0,&readfds);
		FD_SET(sockfd,&readfds);
		select(maxfd,&readfds,NULL,NULL,NULL);//当select唤醒时，它只是知道有就绪的文件描述符，但是不知的谁就绪了
		printf("已经唤醒\n");

		for(i = 0;i < maxfd;i ++)
		{
#if 0
			if(FD_ISSET(0,&readfds) != 0)//当返回值不为0时说明当前文件描述符在表中
			{
				memset(buf,0,sizeof(buf));
				n = read(0,buf,sizeof(buf));
				buf[n - 1] = '\0';
				printf("recvfrom terminel:%s\n",buf);
			}
			if(FD_ISSET(sockfd,&readfds) != 0)
			{
				memset(buf,0,sizeof(buf));
				recv_len = recvfrom(sockfd,buf,sizeof(buf),0,(struct sockaddr *)&cliaddr,&len);
				printf("recvfrom client:%s\n",buf);
			}
#endif 
			if(FD_ISSET(i,&readfds) != 0)
			{
				if(i == 0)
				{
					memset(buf,0,sizeof(buf));
					n = read(0,buf,sizeof(buf));
					buf[n - 1] = '\0';
					printf("recvfrom terminel:%s\n",buf);

				}
				if(i == sockfd)
				{
					memset(buf,0,sizeof(buf));
					recv_len = recvfrom(sockfd,buf,sizeof(buf),0,(struct sockaddr *)&cliaddr,&len);
					printf("recvfrom client:%s\n",buf);
				}
			}
		}
	}
	return 0;
}
