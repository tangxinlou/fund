#include<stdio.h>

#if 0
void swap(int x,int y)// x = a,y = b
{
	int t;

	t = x;
	x = y;
	y = t;
	printf("x = %d,y = %d\n",x,y);
}
#endif
int w = 100;//全局变量和局部变量名称可以重名
void swap(int *p,int *q)// p = &a,q = &b
{
	int t;
	int w = 30;
	t = *p;
	*p = *q;
	*q = t;
	printf("*p = %d,*q = %d\n",*p,*q);
	printf("w = %d\n",w);
}

int main(int argc, const char *argv[])
{
	int a = 10,b = 20;
	
//	swap(a,b);
	swap(&a,&b);
	printf("w = %d,a = %d,b = %d\n",w,a,b);
	
	return 0;
}


