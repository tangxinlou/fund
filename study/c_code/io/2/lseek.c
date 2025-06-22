#include<stdio.h>
#include<sys/types.h>
#include<sys/stat.h>
#include<fcntl.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
	int fd;

	fd = open("./1.txt",O_WRONLY | O_TRUNC | O_CREAT,0664);

	lseek(fd,10,SEEK_SET);
	write(fd,"a",1);

	close(fd);
	return 0;
}
