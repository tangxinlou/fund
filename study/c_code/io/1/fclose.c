#include<stdio.h>

int main(int argc, const char *argv[])
{
	FILE *fp;

	fp = fopen("./1.txt","w");

	fprintf(fp,"hello");
//	fflush(fp);
	
	fclose(fp);//释放缓存空间
	//养成一个每次执行完程序时都要调用一次fclose函数
	while(1);
	return 0;
}
