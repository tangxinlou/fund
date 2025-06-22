#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	int fd;

//	fd = open("./1.txt",O_RDONLY);
	fd = open("./1.txt",O_WRONLY | O_CREAT | O_TRUNC,0664);
	if(fd == -1)
	{
		perror("open");
		return -1;
	}
#if 0
	char buf[10];
	ssize_t n;
	n = read(fd,buf,sizeof(buf));
	printf("n = %d\n",n);
//	buf[n - 1] = '\0';
	printf("%s\n",buf);
#endif

	char buf[100] = "hello";
	write(fd,buf,strlen(buf));
	close(fd);
	return 0;
}
