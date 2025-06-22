#include<stdio.h>

int main(int argc, const char *argv[])
{
	int a = 10;
	int *p = &a;
#if 0
	printf("p = %p\n",p);//打印的是p存放的地址
	printf("&p = %p\n",&p);//打印的是p变量自己的地址

	printf("p + 1 = %p\n",p + 1);
#endif

#if 0	
	printf("p = %p\n",p);//打印的是p存放的地址
	printf("%d\n",*p ++);//先执行后缀++，但是因为后缀有特殊性先拿出p原有值，再和*结合取出p指向空间内容，最后p自增
	printf("p = %p\n",p);//打印的是p存放的地址
	printf("%d\n",*p);
#endif 

	printf("p = %p\n",p);//打印的是p存放的地址
	printf("%d\n",(*p) ++);//p先和*结合取出10，10对应对应的变量自增
	printf("p = %p\n",p);//打印的是p存放的地址
	printf("%d\n",a);
	
	return 0;
}

//p++ != p + 1
//p ++ <==> p = p + 1;
