#include<stdio.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	//printf("%d\n",strcmp("w","hello"));	
	//字符串1 > 字符串2  返回1
	//字符串1 < 字符串2  返回-1
	//字符串1 == 字符串2 返回0

	//一般什么情况下使用strcmp
	//比如:无限循环读取字符串，当读取到quit时循环退出
	
	char str[100];
	while(1)
	{
//		gets(str);
		fgets(str,sizeof(str),stdin);		
//		if(strcmp(str,"quit") == 0)
		if(strncmp(str,"quit",4) == 0)//只比较前面四个字节
			break;
		puts(str);
	}
	return 0;
}
