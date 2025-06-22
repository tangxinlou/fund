#include<stdio.h>
#include<dirent.h>
int main(int argc, const char *argv[])
{
	DIR *dir;
	struct dirent *p;
	dir = opendir(".");
	
	while((p = readdir(dir)) != NULL)
		printf("%s\n",p->d_name);
	return 0;
}
