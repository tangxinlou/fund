#include<stdio.h>
#include<sys/types.h>
#include<sys/shm.h>
#include<sys/ipc.h>
#include<signal.h>
#include<errno.h>
#include<string.h>

typedef struct 
{
	pid_t pid;
	char buf[64];
}SHM;

void fun(int signo)
{

}

int main(int argc, const char *argv[])
{
	signal(SIGUSR1,fun);
	key_t key;

	key = ftok(".",'a');
	
	SHM *p;
	int shmid;
	pid_t peerpid;
	shmid = shmget(key,sizeof(SHM),0664 | IPC_CREAT | IPC_EXCL);
	if(shmid == -1)
	{
		if(errno == EEXIST)
		{
			shmid = shmget(key,sizeof(SHM),0664);
			p = shmat(shmid,NULL,0);	

			//获取对方PID
			peerpid = p->pid;
			//写入自己的PID到共享内存
			p->pid = getpid();
			kill(peerpid,SIGUSR1);
		}
		else 
		{
			perror("shmget");
			return -1;
		}
	}
	else 
	{
		p = shmat(shmid,NULL,0);
		p->pid = getpid();//写自己pid到共享内存区
		pause();
		peerpid = p->pid;
	}

	while(1)
	{
		printf("input data:");
		fgets(p->buf,sizeof(p->buf),stdin);//从终端读取数据写入到共享内存中

		kill(peerpid,SIGUSR1);

		if(strncmp(p->buf,"quit",4) == 0)
			break;

		pause();
	}
	shmdt(p);
	return 0;
}
