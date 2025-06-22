#include<stdio.h>

//auto int b;验证auto不能用于全局变量
int a;//全局变量，静态,分配到BSS段
int b = 10;//在数据段分配
//上面的a、b没有存储类型
int main(int argc, const char *argv[])
{
	int a;//局部变量，动态，使用的存储类型是auto,在栈区分配
		  //未初始化的变量，默认值是随机的
	printf("%d\n",a);
	return 0;
}
