#include<stdio.h>

struct A
{
	int a;
	char b;
	char c;
};
//正常情况这个结构体字节数是6
//结构体的内存字节对齐——便于对数据的查找，可以提高程序的执行效率，但是浪费内存空间
//所谓的按照4个字节对齐，不管我们的成员是否能用到4个字节，反正分配的时候直接分配4个字节

struct B
{
	char a;
	short b;
	char c;
};
//最大的基本类型是>=4字节时，按照4个字节对齐
//最大的基本类型是2个字节，所以按照2个字节对齐。
//在内存中给某个类型的元素分配空间时，地址是类型的倍数

struct C
{
	int a;
	char b;
	short c;
	char d;
};
//2000 2001 2002 2003
//2004 2005 2006 2007
int main(int argc, const char *argv[])
{
	printf("%d\n",sizeof(struct A));	
	printf("%d\n",sizeof(struct B));
	printf("%d\n",sizeof(struct C));
	return 0;
}

