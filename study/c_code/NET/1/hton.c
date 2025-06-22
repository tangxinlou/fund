#include<stdio.h>
#include<arpa/inet.h>

int main(int argc, const char *argv[])
{
	int horder = 0x12345678;//当前系统主机字节序是小端
	uint32_t norder;

	norder = htonl(horder);
	printf("%#x\n",norder);

	horder = ntohl(norder);
	printf("%#x\n",horder);
	return 0;
}
