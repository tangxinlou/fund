#include<stdio.h>

int main(int argc, const char *argv[])
{
	char s[100] = "hello";
	char t[] = "world";
	
	//自己实现字符串连接
	
	int i = 0;
	int j = 0;
	while(s[i] != '\0')//循环结束时，i = 5;
		i ++;

	while(t[j] != '\0')//ab\0
	{
		s[i] = t[j];
		i ++;
		j ++;
	}
	s[i] = '\0';
	printf("%s\n",s);
	return 0;
}
