#include<stdio.h>
#include<math.h>
//编译时gcc后面加 -lm   链接某个库文件
int main(int argc, const char *argv[])
{
	float a,b,c,s,area;

	if(scanf("%f,%f,%f",&a,&b,&c) < 3)
	{
		printf("input num error\n");
		return -1;
	}

	if(a + b <= c || a + c <= b || b + c <= a)
	{
		printf("error\n");
		return -1;
	}

	s = 1.0 / 2 * (a + b + c);
	area = sqrt(s * (s - a) * (s - b) * (s - c));

	printf("%.2f\n",area);
	return 0;
}
