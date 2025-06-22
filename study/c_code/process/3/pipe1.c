#include<stdio.h>
#include<unistd.h>
//管道空间大小
int main(int argc, const char *argv[])
{
	int fd[2];
	pipe(fd);
	int count = 0;

	while(1)
	{
		write(fd[1],"a",1);
		count ++;

		printf("%d\n",count);
	}
	return 0;
}
