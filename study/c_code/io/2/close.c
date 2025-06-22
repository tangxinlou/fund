#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>

int main(int argc, const char *argv[])
{
	int fd1,fd2,fd3,fd4;

	fd1 = open("./1.txt",O_RDONLY);
	fd2 = open("./1.txt",O_RDONLY);
	fd3 = open("./1.txt",O_RDONLY);

	printf("fd1 = %d,fd2 = %d,fd3 = %d\n",fd1,fd2,fd3);
	
	close(fd2);
	fd4 = open("./1.txt",O_RDONLY);
	printf("fd4 = %d\n",fd4);
	return 0;
}
