#include<stdio.h>

int main(int argc, const char *argv[])
{
	char a[2][3] = {{'a','b','c'},{'d','e','f'}};
	char b[3][3];
	char (*str[2])[3] = {a,b};// <==> char (*)[3] str[2] = {p1,p2}
					  //	  int *       str[2] = {地址1，地址2};
					  //
	
	char (**p)[3];
	p = str;
	//需求是打印字符e
	//思路：
	//1、先找到e的地址
	//2、寻找d的地址
	//3、通过数组名a找到 
	//4、通过str找到数组名a
	//5、通过指针变量p找到str

	//实现过程是思路的逆序
	//*(p + 0)就是a
	//*(p + 0) + 1就是数组a的第二行的行地址
	//*(*(p + 0) + 1)就是数组a的第二行的列地址
	printf("%c\n",*(*(*(p + 0) + 1) + 1));
	return 0;
}
