#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 0x12345678;//12高字节，78是低字节

	char *p	= (char *)&a;

	int i;
	for(i = 0;i < 4;i ++)
	{
		printf("%#x\n",*(p + i)); //p低地址  p + 3高地址
	}
	//主机字节序:大端或小端 和cpu架构相关(和公司相关)
	//低地址存放了低字节——小端序
	return 0;
}
