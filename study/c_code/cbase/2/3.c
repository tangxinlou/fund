#include<stdio.h>

//宏替换本质是一堆字符的完整替换
#define N 3 + 7

int main(int argc, const char *argv[])
{
	int x;

	x = N * N;

	printf("%d\n",x);
	return 0;
}
