#include<stdio.h>

int main(int argc, const char *argv[])
{
	FILE *fp;

//	fp = fopen("./3.txt","a");
	fp = fopen("3.txt","a+");
	if(fp == NULL)
	{
		perror("fopen");
		return -1;
	}

//	fprintf(fp,"17061io");
	
	char buf[100];
	fscanf(fp,"%s",buf);
	printf("%s\n",buf);

	fprintf(fp,"helloworld");
	return 0;
}
