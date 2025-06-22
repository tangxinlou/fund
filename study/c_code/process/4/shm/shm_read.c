#include<stdio.h>
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/shm.h>

int main(int argc, const char *argv[])
{
	key_t key;

	key = ftok(".",'w');

	int shmid;

//	shmid = shmget(key,100,0664);//单纯的是打开共享内存
	shmid = shmget(key,100,0664 | IPC_CREAT);
	if(shmid == -1)
	{
		perror("shmget");
		return -1;
	}
	
	char *p;

	p = shmat(shmid,NULL,0);//如果这个函数执行成功，p就是指向共享内存区的一个指针
	printf("%s\n",p);//将共享内存区内存打印到终端/读出共享内存区内容
	
	shmdtl(p);
	shmctl(shmid,IPC_RMID,NULL);
	return 0;
}
