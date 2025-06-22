#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<sys/select.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	int sockfd,connfd;

	sockfd = socket(AF_INET,SOCK_STREAM,0);
	if(sockfd == -1)
	{

	}

	struct sockaddr_in seraddr,cliaddr;
	
	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(atoi(argv[1]));
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.195");

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

	int maxfd = sockfd;
	fd_set globalfds;
	FD_ZERO(&globalfds);

	FD_SET(sockfd,&globalfds);
	fd_set curfds;
	FD_ZERO(&curfds);
	int i;
	int len = sizeof(cliaddr);

	int recv_len;
	char buf[64];

	struct timeval tl;
	int n;
	while(1)
	{
		tl.tv_sec = 5;
		tl.tv_usec = 0;
		curfds = globalfds;//第一次执行时，curfds和globalfds中都只存放了sockfd文件描述符
		n = select(maxfd + 1,&curfds,NULL,NULL,&tl);
		if(n == 0)
		{
			printf("time out\n");
			continue;
		}


		for(i = 0;i <= maxfd;i ++)
		{
			if(FD_ISSET(i,&curfds))
			{
				if(i == sockfd)
				{
					connfd = accept(sockfd,(struct sockaddr *)&cliaddr,&len);

					FD_SET(connfd,&globalfds);
					if(connfd > maxfd)
						maxfd = connfd;
				}
				else //客户端接收数据
				{
					memset(buf,0,sizeof(buf));
					recv_len = recv(i,buf,sizeof(buf),0);	
					if(recv_len == -1)
					{
						perror("recv");
						break;
					}
					if(recv_len == 0)
					{
						printf("有客户端退出\n");
						FD_CLR(i,&globalfds);

						if(i == maxfd)
						{
							while(maxfd --)
							{
								if(FD_ISSET(maxfd,&globalfds))
									break;
							}
						}
						close(i);
					}
					if(recv_len > 0)
					{
						printf("recv from %s:%d:%s\n",inet_ntoa(cliaddr.sin_addr),ntohs(cliaddr.sin_port),buf);
					}
				}
			}
		}

	}
	return 0;
}
