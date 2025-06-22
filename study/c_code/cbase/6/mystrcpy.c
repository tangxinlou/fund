#include<stdio.h>

int main(int argc, const char *argv[])
{
	char s[100] = "china anhui chuzhou fengyang";
	char t[] = "anhui keji xueyuan";

	int i = 0;

	while(t[i] != '\0')
	{
		s[i] = t[i];
		i ++;
	}
	s[i] = '\0';
	printf("%s\n",s);
	return 0;
}
