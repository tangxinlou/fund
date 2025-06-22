#include<stdio.h>
#include<string.h>

int main(int argc, const char *argv[])
{
	char s[100] = "hello";
//	char t[] = "world";

//	printf("%s\n",strcat(s,t));
//	printf("%s\n",s);

	printf("%s\n",strcat(s,"world"));
	return 0;
}
