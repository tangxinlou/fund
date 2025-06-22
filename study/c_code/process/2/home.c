#include<stdio.h>
#include<sys/types.h>
#include<stdlib.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
	pid_t pid;
	int fd1,fd2;
	int len;
	fd1 = open(argv[1],O_RDONLY);
	fd2 = open(argv[2],O_WRONLY | O_CREAT | O_TRUNC,0664);

	len = lseek(fd1,0,SEEK_END);//获取文件字节数
	len /= 2;
	pid = fork();

	if(pid == -1)
	{

	}
	else if(pid == 0)
	{
#if 0
		//继承了父进程的两个文件描述符	
		int len;
		len = lseek(fd1,5,SEEK_CUR);
		printf("len = %d\n",len);
		//说明子进程继承的文件描述符会影响父进程的操作，所以要避免
#endif
#if 1
		fd1 = open(argv[1],O_RDONLY);
		fd2 = open(argv[2],O_WRONLY);
		
		lseek(fd1,len,SEEK_SET);
		lseek(fd2,len,SEEK_SET);
		
		char buf[10];
		ssize_t n;
		while((n = read(fd1,buf,sizeof(buf))) > 0)
			write(fd2,buf,n);

		close(fd1);
		close(fd2);
#endif 
	}
	else 
	{
	//	lseek(fd1,10,SEEK_SET);
		lseek(fd1,0,SEEK_SET);
		
		ssize_t n;
		ssize_t sum = 0;
		char buf[10];
		while(1)
		{
			n = read(fd1,buf,sizeof(buf));
			sum += n;
			if(sum > len) //说名第一次超过文件一半大小
			{
				write(fd2,buf,sizeof(buf) - (sum - len));
				break;
			}
			write(fd2,buf,n);
		}
		close(fd1);
		close(fd2);
	}
	return 0;
}
