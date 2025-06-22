#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 10;
	printf("a = %d\n",a);

//	char b = 'w';
//	printf("b = %c\n",b);

	float c = 1.2;
	printf("c = %f\n",c);

	printf("a = %#x\n",a);
	printf("a = %#X\n",a);

	char str[] = {'a','b','c'};
	printf("%s\n",str);

	float f = 567891234;
	printf("%e\n",f);


	long value = 100;
	printf("%ld\n",value);
	printf("%-5ld\n",value);
	printf("%05ld\n",value);
	
	long long value1 = 200;
	printf("%lld\n",value1);

	double x = 1.23756;
	printf("%.2lf\n",x);


	return 0;
}
