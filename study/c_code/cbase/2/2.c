#include<stdio.h>

int main(int argc, const char *argv[])
{
//	char a = 'a';//这是字符a，永远不要忘记字符引用时要加单引号
    // 0 '0' '\0'
	
	char str[] = "hello";//存放在栈区
	str[1] = 'w';

//	char *str = "hello";//存放在只读数据区
//	*(str + 1) = 'w';
	printf("%s\n",str);
	return 0;
}
