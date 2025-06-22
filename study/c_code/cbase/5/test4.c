#include<stdio.h>

int main(int argc, const char *argv[])
{
	int ch;

	ch = getchar();

	if(ch >= 'a' && ch <= 'z')
		ch = ch - 32;
	else if(ch >= 'A' && ch <= 'Z')
		;
	else 
		printf("输入的不是大小写字母\n");

	int i,j;

	for(i = 0;i <= ch - 'A';i ++)//控制行数
	{
		for(j = 0;j <= 2 * i;j ++)//控制每行所有字符的个数
		{
			if(j < i)
				putchar('*');
			else
				putchar(ch - (j - i));
		}
		printf("\n");
	}
	return 0;
}
