#include<stdio.h>

struct 
{
	pid_t pid;
	char buf[100];
};

int main(int argc, const char *argv[])
{
	signal();//捕捉信号
	//1、创建key值
	//2、创建并且打开共享内存
	
	shmid = shmget(key,结构体size,0664 | IPC_CREAT | IPC_EXCL);
	if(shmid == -1)
	{
		if(errno == EEXIST)//其他进程创建的共享内存，共享内存没有打开
		{
			//打开共享内存
			//读出对方PID
			//写入自己PID
			//给对方发送信号
		}
		else 
		{

		}
	}
	else //shmget返回值不是-1，当前进程创建的共享内存,共享内存已经打开了
	{
		//写自己的PID到共享内存
		//阻塞
		//读出对方PID
	}	

	//写内存
	while(1)
	{
		//从终端读数据写入到共享内存中
		//给对方发送信号
		//阻塞
	}
	//取消映射
	return 0;
}
