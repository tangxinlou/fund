#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 10;
	int b = 20;
#if 0
	if(a ++ == 10 && b != 20)
		;
	printf("a = %d\n",a);
#endif
	if(a == 10 || b ++ == 20)
		printf("b = %d\n",b);

	return 0;
}
