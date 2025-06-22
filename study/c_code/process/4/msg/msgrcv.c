#include<stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
typedef struct 
{
	long type;
	char buf[64];
}MSG;

int len = sizeof(MSG) - sizeof(long);

int main(int argc, const char *argv[])
{
	key_t key;
	MSG mymsg;

	key = ftok(".",'a');

	int msgid;

	msgid = msgget(key,0664 | IPC_CREAT);
	if(msgid == -1)
	{

	}

	ssize_t n;
	while(1)
	{
		n = msgrcv(msgid,&mymsg,len,100,0);

		if(strncmp(mymsg.buf,"quit",4) == 0)
			break;

		printf("recv from msgsnd.c %s\n",mymsg.buf);
	}

	msgctl(msgid,IPC_RMID,NULL);
	return 0;
}
