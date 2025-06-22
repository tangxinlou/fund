#include<stdio.h>

int main(int argc, const char *argv[])
{
	FILE *fp;

	fp = fopen("./1.txt","w");
	
	fseek(fp,10,SEEK_SET);//从头开始偏移10个位置到第11个位置
						 //如果只是对文件进行偏移，那么生成的文件其实被叫做空洞文件，空洞本身并不实际占用空间。
	fputc('a',fp);

	fseek(fp,5,SEEK_CUR);
	fputc('b',fp);
	
	fseek(fp,-3,SEEK_END);
	fputc('c',fp);
	fputc('d',fp);

	fseek(fp,5,SEEK_END);
	fputc('e',fp);
	fclose(fp);

	return 0;
}
