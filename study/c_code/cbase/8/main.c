#include<stdio.h>

int main(int argc, const char *argv[])
{
	printf("argc = %d\n",argc);//给主函数传递的实参的个数
	printf("argv[0] = %s\n",argv[0]);//分别存放了每个实参字符串的首地址
	printf("argv[1] = %s\n",argv[1]);
	printf("argv[2] = %s\n",argv[2]);
	printf("argv[3] = %s\n",argv[3]);
	return 0;
}
