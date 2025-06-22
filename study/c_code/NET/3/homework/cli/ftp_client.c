#include<stdio.h>
#include<sys/types.h>
#include<sys/socket.h>
#include<netinet/in.h>
#include<arpa/inet.h>
#include<string.h>
#include<stdlib.h>

#define SEARCH 100
#define DOWN 200
#define END 500
#define FAIL 300
#define SUCCESS 400

struct msg 
{
	int type;
	int flag;
	char buf[64];
	char fname[15];
};

int search_serverdir(int sockfd,struct msg info)
{
	info.type = SEARCH;
	send(sockfd,&info,sizeof(info),0);
	while(1)
	{
		recv(sockfd,&info,sizeof(info),0);
		if(info.flag == END)
			break;
		printf("%s ",info.buf);
	}
	printf("\n");
	return 0;
}

int ftp_download(int sockfd,struct msg info)
{
	info.type = DOWN;
	printf("请输入要下载的文件名:");
	fgets(info.fname,sizeof(info.fname),stdin);
	info.fname[strlen(info.fname) - 1] = '\0';
	send(sockfd,&info,sizeof(info),0);
	recv(sockfd,&info,sizeof(info),0);

	if(info.flag == FAIL)
	{
		printf("服务器打开文件失败\n");
		return -1;
	}
	if(info.flag == SUCCESS)
		printf("服务器打开文件成功\n");

	FILE *fp;
	fp = fopen(info.fname,"w");
	if(fp == NULL)
	{
		perror("fopen");
		return -1;
	}
	
	int len;
	while(1)
	{
		len = recv(sockfd,info.buf,sizeof(info.buf),0);

		fwrite(info.buf,1,len,fp);
		if(len < sizeof(info.buf))
			break;
	}
	printf("下载成功\n");
	fclose(fp);
	return 0;
}

int main(int argc, const char *argv[])
{
	int sockfd;

	sockfd = socket(AF_INET,SOCK_STREAM,0);
	if(sockfd == -1)
	{
		perror("socket");
		return -1;
	}

	struct sockaddr_in seraddr;

	seraddr.sin_family = AF_INET;
	seraddr.sin_port = htons(atoi(argv[1]));
	seraddr.sin_addr.s_addr = inet_addr("192.168.199.195");

	if(connect(sockfd,(struct sockaddr *)&seraddr,sizeof(seraddr)) == -1)
	{
		perror("connect");
		return -1;
	}

	char buf[10];
	int choice;
	struct msg info;
	while(1)
	{
		printf("***1.查询 2.下载*** 0.退出\n");
		printf("请输入你的选择:");
		fgets(buf,sizeof(buf),stdin);
		choice = buf[0] - '0';

		switch(choice)
		{
		case 1:
			search_serverdir(sockfd,info);
			break;
		case 2:
			ftp_download(sockfd,info);
			break;
		case 0:
			exit(EXIT_SUCCESS);
		}
	}
	return 0;
}
