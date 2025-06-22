#include<stdio.h>
//a bcd  abbcd abccd abcdd abcd
//1  234  循环移位后 1 234 
void del_space(char p[])
{
	char *s;
	while(*p != '\0')
	{
		if(*p == ' ')
		{
			s = p;//s和p都是指向空格的
			while(*s != '\0')
			{
				*s = *(s + 1);
				s ++;
			}
		}
		else 
			p ++;
	}
}

int main(int argc, const char *argv[])
{
	char str[100];

	gets(str);

	del_space(str);
	puts(str);
	return 0;
}
