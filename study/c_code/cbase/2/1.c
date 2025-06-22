#include<stdio.h>
int main(int argc, const char *argv[])
{
	float a = 1.1;
	float b = .123;

	printf("%f\n",a);
	printf("%f\n",b);

	int c = 1.1e5;//不能写成1.1*e5
	// 1.1e5 <==> 1.1E5
	// e的后面一定是整数
	printf("%d\n",c);
	return 0;
}
