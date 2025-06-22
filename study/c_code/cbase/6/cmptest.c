#include<stdio.h>
#include<string.h>
int main(int argc, const char *argv[])
{
	char word[100];
	char max[100];
	char min[100];
	gets(word);

	strcpy(max,word);//假设第一次输入的内容是最大值
	strcpy(min,word);//假设第一次输入的内容是最小值

	while(1)
	{
		gets(word);

		if(strncmp(word,"quit",4) == 0)
			break;

		if(strcmp(max,word) < 0)
			strcpy(max,word);

		if(strcmp(min,word) > 0)
			strcpy(min,word);
	}

	printf("max:%s\n",max);
	printf("min:%s\n",min);

	return 0;
}
