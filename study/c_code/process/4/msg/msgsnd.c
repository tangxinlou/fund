#include<stdio.h>
#include <sys/types.h>
#include <sys/ipc.h>
#include <sys/msg.h>
#include<string.h>

typedef struct
{
	long type;
	char buf[64];
}MSG;

int len = sizeof(MSG) - sizeof(long);

int main(int argc, const char *argv[])
{
	key_t key;

	key = ftok(".",'a');

	int msgid;
	MSG mymsg;
	msgid = msgget(key,0664 | IPC_CREAT);
	if(msgid == -1)
	{

	}

	while(1)
	{
		fgets(mymsg.buf,sizeof(mymsg.buf),stdin);//abc\n\0
		mymsg.buf[strlen(mymsg.buf) - 1] = '\0';
		mymsg.type = 100;
		if(msgsnd(msgid,&mymsg,len,0) == -1)
		{
			perror("msgsnd");
			return -1;
		}

		if(strncmp(mymsg.buf,"quit",4) == 0)
			break;
	}
	return 0;
}
