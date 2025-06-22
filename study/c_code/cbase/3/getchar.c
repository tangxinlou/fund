#include<stdio.h>

int main(int argc, const char *argv[])
{
//	unsigned char ch;
	int ch;
	ch = getchar();
	if(ch == EOF)
	{
		printf("error\n");
		return -1;
	}
	printf("%c\n",ch);
	return 0;
}
