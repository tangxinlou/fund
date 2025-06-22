#include<stdio.h>
#include<sys/types.h>
#include<sys/ipc.h>
#include<sys/shm.h>

int main(int argc, const char *argv[])
{
	key_t key;

	key = ftok(".",'w');

	int shmid;
	char *p;

	shmid = shmget(key,100,0664 | IPC_CREAT);
	p = shmat(shmid,NULL,0);

	scanf("%s",p);
	return 0;
}
