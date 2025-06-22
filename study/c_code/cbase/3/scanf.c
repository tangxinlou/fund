#include<stdio.h>

int main(int argc, const char *argv[])
{
#if 0
	int a,b;
//	scanf("%d",&a);//在scanf格式后不能出现\n,如果出现它会吞掉所有不可见字符
	scanf("a=%d--b=%d",&a,&b);
	printf("%d,%d\n",a,b);

	int a;
	scanf("%i",&a);//终端上输入时可以指定进制
	printf("%d\n",a);
#endif
	
	char a,b;
	scanf("%c%c",&a,&b);//%c格式读取数据时,空格和TAB就不是分割符了
	printf("a = %c,b = %c\n",a,b);

	return 0;
}
