#include<stdio.h>
#include<stdlib.h>

int main(int argc, const char *argv[])
{
	char *s;

	s = (char *)malloc(10);//在堆区中分配10个字节空间，将10个字节空间首地址赋值给s
	printf("%p\n",s);	
	scanf("%s",s);
	printf("%s\n",s);

	free(s);//释放在堆区中申请的某个空间,本质是释放了堆空间的内容.
	s = NULL;//防止s指针被其他程序或者其他位置误用
	printf("%p\n",s);	
	printf("%s\n",s);

//  空间虽然被释放了，但是申请过的指针还可以继续使用。
//	scanf("%s",s);
//	printf("%s\n",s);
	
	return 0;
}
