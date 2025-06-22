#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<arpa/inet.h>
#include<netinet/in.h>
#include<stdlib.h>
#include<signal.h>

int main(int argc, const char *argv[])
{
	if(argc < 2)
	{
		printf("input error\n");
		return -1;
	}
	int sockfd;
	
	signal(SIGCHLD,SIG_IGN);//SIGCHLD当子进程退出时产生的信号，这个信号默认没有任何操作
						   //僵尸进程的产生子进程退出，父进程没有回收资源，同时还因为父进程接收到了SIGCHLD信号。
						   //如果父进程忽略了SIGCHLD信号，则不会出现僵尸进程，因为资源的回收交给了init
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
	
	if(listen(sockfd,5) == -1)
	{
		perror("listen");
		return -1;
	}

	int connfd;
	socklen_t len = sizeof(cliaddr);
#if 0
	while(1)//tcp的循环服务器,这种模型会因为某个客户端的操作造成服务器阻塞，从而影响其他客户端建立连接
	{
		connfd = accept(sockfd,(struct sockaddr *)&cliaddr,&len);
		if(connfd == -1)
		{
			perror("accept");
			return -1;
		}
		
		recv();
	}
	close(connfd);
	close(sockfd);
#endif
	pid_t pid,pid1;
	char buf[10];
	int n;
	//tcp并发服务器(多进程、多线程),只能用于小型服务器
	while(1)
	{
		connfd = accept(sockfd,(struct sockaddr *)&cliaddr,&len);
		if(connfd == -1)
		{
			perror("accept");
			continue;//因为服务不能由于一个客户端连接失败而退出。
		}

		pid = fork();//执行多次不会出现新的父进程
		if(pid == -1)
		{
			perror("fork");
			continue;
		}
		else if(pid == 0)
		{
			close(sockfd);
			while(1)
			{
				n = recv(connfd,buf,sizeof(buf),0);
				if(n == -1)
				{
					perror("recv");
					exit(EXIT_FAILURE);
				}
				if(n == 0)
				{
					printf("客户端退出\n");
					exit(EXIT_SUCCESS);
				}
				printf("recv:%s\n",buf);
			}
		}
		else 
		{
		//	wait(NULL);可能由于某个子进程不退出，所以wait会阻塞，其他后续客户端不会正常建立连接。
			close(connfd);	
		}
 
#if 0
		pid = fork();
		if(pid == -1)
		{

		}
		else if(pid == 0)
		{
			pid1 = fork();

			if(pid1 == -1)
			{

			}
			else if(pid1 == 0)//孙进程,孙进程会变成孤儿进程，后续一切资源直接由init进程回收
			{
				close(sockfd);
				while(1)
				{
					n = recv(connfd,buf,sizeof(buf),0);
					if(n == -1)
					{
						perror("recv");
						exit(EXIT_FAILURE);
					}
					if(n == 0)
					{
						printf("客户端退出\n");
						exit(EXIT_SUCCESS);
					}
					printf("recv:%s\n",buf);

				}
			}
			else 
			{
				exit(EXIT_SUCCESS);
			}
		}
		else 
		{
			wait(NULL);
		}
#endif
		
	}
	return 0;
}
