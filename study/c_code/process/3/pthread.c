#include<stdio.h>
#include<pthread.h>

pthread_mutex_t mutex;
pthread_cond_t cond;
int a[5] = {1,2,3,4,5};

void *thread1(void *arg)
{
	int i;
	pthread_mutex_lock(&mutex);
	for(i = 0;i < 5;i ++)
	{
		printf("%d\n",a[i]);
		sleep(1);
	}
	pthread_mutex_unlock(&mutex);
	pthread_cond_signal(&cond);//给pthread_cond_wait函数发送条件
	pthread_exit(NULL);
}

void *thread2(void *arg)
{
	int i;
	
	pthread_mutex_lock(&mutex);
	pthread_cond_wait(&cond,&mutex);//接收条件
	for(i = 4;i >= 0;i --)
	{
		printf("%d\n",a[i]);
		sleep(1);
	}
	pthread_mutex_unlock(&mutex);
	pthread_exit(NULL);
}

void *thread3(void *arg)
{
	while(1)
	{
		printf("my name is thread3\n");
		sleep(1);
	}
}

int main(int argc, const char *argv[])
{
	int ret;
	pthread_t tid1,tid2,tid3;

	ret = pthread_create(&tid1,NULL,thread1,NULL);

	ret = pthread_create(&tid2,NULL,thread2,NULL);

	ret = pthread_create(&tid3,NULL,thread3,NULL);

	
	pthread_mutex_init(&mutex,NULL);//初始化锁(相当于买锁)
	pthread_cond_init(&cond,NULL);//初始化条件变量

	pthread_join(tid1,NULL);
	pthread_join(tid2,NULL);


	return 0;
}
