#include<stdio.h>

int main(int argc, const char *argv[])
{
	FILE *fp;

//	fp = fopen("./1.txt","w");
	fp = fopen("./1.txt","w+");
	if(fp == NULL)
	{
		perror("fopen");
		return -1;
	}
	
	fprintf(fp,"hello");
	fprintf(fp,"world");
	
	//fp --;//文件指针不能自增自减
	
	rewind(fp);//将文件指针重新定位到文件开头

	char buf[100];
	fscanf(fp,"%s",buf);
	printf("%s\n",buf);

	return 0;
}
