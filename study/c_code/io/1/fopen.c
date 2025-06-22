#include<stdio.h>
#include<errno.h>

int main(int argc, const char *argv[])
{
	if(argc < 2)
	{
		fprintf(stderr,"argv[] input error\n");
		return -1;
	}

	FILE *fp;
//	fp = fopen("./1.txt","r");
//	fp = fopen("./2.txt","r+");
	fp = fopen(argv[1],"r+");//注意:不要写成 fp = fopen("argv[1]","r+");
	if(fp == NULL)
	{
		printf("errno = %d\n",errno);
		perror("fopen");//只有当错误是因为函数返回值出错时才能使用perror
		return -1;
	}

#if 0	
	//读文件			
	char buf[10];
//	scanf("%s",buf);//从终端读取字符串	
	fscanf(fp,"%s",buf);//从文件中读取字符串存放到buf数组中
	printf("%s\n",buf);
#endif
	fprintf(fp,"123\n");
//	fprintf(fp,"456\n");

	return 0;
}
