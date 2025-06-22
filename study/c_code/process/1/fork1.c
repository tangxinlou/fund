#include<stdio.h>
#include<sys/types.h>
#include<unistd.h>
#include<stdlib.h>

int b = 20;
int main(int argc, const char *argv[])
{
	pid_t pid;
	int a = 10;
	
	char *p;

	p = malloc(10);
	scanf("%s",p);
	pid = fork();
//	printf("after fork:%d\n",pid);
	if(pid == -1)
	{
		perror("fork");
		return -1;
	}
	else if(pid == 0)//child
	{
		printf("child\n");
		printf("pid = %d\n",pid);
		a ++;
		b ++;
		printf("%d,%d\n",a,b);
		printf("&a = %p\n",&a);

		*(p + 1) = 'w';
		printf("%s\n",p);
	}
	else //父进程 
	{
	//	sleep(1);//操作系统见到某个进程中有延时函数时，暂时不会给当前进程分配时间片
		printf("father\n");
		printf("pid = %d\n",pid);
		a ++;
		b ++;
		printf("%d,%d\n",a,b);
		printf("&a = %p\n",&a);
		*(p + 1) = 'x';
		printf("%s\n",p);
	}
	return 0;
}
