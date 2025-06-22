#include<stdio.h>

int main(int argc, const char *argv[])
{
	char a;
	short b;
	int c;
	float d;
	double e;
	long f;
	long long g;

	printf("%d\n",sizeof(a));
	printf("%d\n",sizeof(char));
	printf("%d\n",sizeof(b));
	printf("%d\n",sizeof(c));
	printf("%d\n",sizeof(d));
	printf("%d\n",sizeof(e));
	printf("%d\n",sizeof(f));
	printf("%d\n",sizeof(g));
	//建议使用sizeof(变量名)
	//注意:sizeof()不是函数，它是运算符(关键字)
	return 0;
}
