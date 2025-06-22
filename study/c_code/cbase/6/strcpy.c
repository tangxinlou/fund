#include<stdio.h>
#include<string.h>
int main(int argc, const char *argv[])
{
	char s[100] = "helloworld";
	char t[] = "123";

	printf("%s\n",strcpy(s,t));

	int i;

	for(i = 0;i < 100;i ++)
	{
		printf("%c\t",s[i]);
	}
	printf("\n");
	return 0;
}
