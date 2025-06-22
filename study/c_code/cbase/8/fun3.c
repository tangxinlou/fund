#include<stdio.h>

#if 0
//void fun(int (*p)[3])
void fun(int p[2][3])
{
	printf("%d\n",*(*(p + 1) + 1));
}

int main(int argc, const char *argv[])
{
	int a[2][3] = {1,2,3,4,5,6};

	fun(a);
	return 0;
}
#endif

//void fun(char **p)
void fun(char *p[])
{
	printf("%s\n",*(p + 1));
}


int main(int argc, const char *argv[])
{
	char *str[] = {"hello","anhui","china"};
	
	fun(str);
	return 0;
}
