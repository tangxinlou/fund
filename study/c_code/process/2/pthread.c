#include<stdio.h>
#include<pthread.h>

int global = 100;

void *your_first_thread(void *arg)//这就是线程
{
	while(1)	
	{
		printf("global:%d\n",global);
		sleep(1);
	}
}

void *your_second_thread(void *arg)
{
	static int i;
	int value = *((int *)arg);
	for(i = 0;i < 5;i ++)
	{
		printf("global:%d,value:%d\n",global,value);
		sleep(1);
	}
	pthread_exit((void *)&i);
}

int main(int argc, const char *argv[])
{
	int ret;
	pthread_t tid1;
	pthread_t tid2;
	ret = pthread_create(&tid1,NULL,your_first_thread,NULL);//这是在创建线程
	if(ret != 0)
	{
		perror("pthread_create1");
		return -1;
	}
	int value = 10;
	ret = pthread_create(&tid2,NULL,your_second_thread,(void *)&value);
	if(ret != 0)
	{
		perror("pthread_create2");
		return -1;
	}
	
	int *p;
	pthread_join(tid2,(void **)&p);//当没有线程结束的话这个函数会阻塞，当指定线程结束时这个函数会唤醒
	printf("%d\n",*p);
	printf("end\n");
//	while(1);
	return 0;
}
