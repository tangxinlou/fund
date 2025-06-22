#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<sys/epoll.h>
#include<string.h>

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
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.195");
	
	int on = 1;
	setsockopt(sockfd,SOL_SOCKET,SO_REUSEADDR,&on,sizeof(on));

	if(bind(sockfd,(struct sockaddr *)&seraddr,sizeof(seraddr)) == -1)
	{
		perror("bind");
		return -1;
	}
	
	if(listen(sockfd,5) == -1)
	{
		perror("listen");
		return -1;
	}

	int epollfd;
	epollfd = epoll_create(50);
	if(epollfd == -1)
	{
		perror("epoll_create");
		return -1;
	}

	//让内核知道什么时候sockfd是就绪的。
	struct epoll_event ev;//每产生一个客户端，就会出现一个epoll_event结构体
	ev.data.fd = sockfd;
	ev.events = EPOLLIN;
	epoll_ctl(epollfd,EPOLL_CTL_ADD,sockfd,&ev);


	struct epoll_event events[50];
	int nfds;
	int i;
	int connfd;
	int len = sizeof(cliaddr);
	char buf[64];
	int recv_n;
	while(1)
	{
		nfds = epoll_wait(epollfd,events,50,-1);
		
		//遍历就绪的信息
		for(i = 0;i < nfds;i ++)
		{
			if(events[i].data.fd == sockfd)
			{
				connfd = accept(sockfd,(struct sockaddr *)&cliaddr,&len);	
				if(connfd == -1)
				{
					perror("accept");
				}

				ev.data.fd = connfd;
				ev.events = EPOLLIN;
				epoll_ctl(epollfd,EPOLL_CTL_ADD,connfd,&ev);
			}
			else//用来收发数据 
			{
				memset(buf,0,sizeof(buf));
				recv_n = recv(events[i].data.fd,buf,sizeof(buf),0);
				if(recv_n == -1)
				{
					perror("recv");
				}
				if(recv_n == 0)
				{
					printf("客户端退出\n");
					epoll_ctl(epollfd,EPOLL_CTL_DEL,events[i].data.fd,NULL);
					close(events[i].data.fd);
				}
				if(recv_n > 0)
					printf("recv data:%s\n",buf);
			}
		}

	}
	return 0;
}
