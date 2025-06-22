#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
	int fd1,fd2;

	if(argc < 3)
	{
		fprintf(stderr,"error\n");
		return -1;
	}

	fd1 = open(argv[1],O_RDONLY);

	fd2 = open(argv[2],O_WRONLY | O_CREAT | O_TRUNC,0664);

	ssize_t n;
	char buf[10];
//	while((n = read(fd1,buf,sizeof(buf))) > 0)
	while(1)
	{
		n = read(fd1,buf,sizeof(buf));

		if(n == -1)
		{
			perror("read");
			break;
		}
		if(n == 0)
		{
			break;
		}
		write(fd2,buf,n);
	}
	
	close(fd1);
	close(fd2);
	return 0;
}
