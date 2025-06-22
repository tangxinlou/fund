#include<stdio.h>

struct A
{
	int a;
	char b;
};

int main(int argc, const char *argv[])
{
	struct A str[3] = {{10,'a'},{11,'b'},{12,'c'}};	
	struct A *p = str;
	printf("%d\n",str[1].a);
	printf("%d\n",(p+1)->a);

	printf("%p\n",str);
	printf("%p\n",&str[0]);
	printf("%p\n",&str[0].a);
	return 0;
}
