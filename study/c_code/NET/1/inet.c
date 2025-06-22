#include<stdio.h>
#include<arpa/inet.h>
#include<netinet/in.h>

int main(int argc, const char *argv[])
{
	in_addr_t ip;

	ip = inet_addr("192.168.1.2");
	printf("%#x\n",ip);

	struct in_addr addr;
	char *myip;

	addr.s_addr = ip;
	myip = inet_ntoa(addr);
	printf("%s\n",myip);
	return 0;
}
