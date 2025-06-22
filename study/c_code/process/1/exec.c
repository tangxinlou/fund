#include<stdio.h>
#include<unistd.h>

int main(int argc, const char *argv[])
{
	printf("start\n");
//	execl("/bin/ls","ls","-l","/",NULL);
	
//	char *const str[] = {"ls","-l","/",NULL};
//	execv("/bin/ls",str);
//	printf("end\n");

//	int a = 10;

//	a += 5;
//	printf("a = %d\n",a);

//	execl("./fork","./fork",NULL);
	execl("./test.sh","./test.sh",NULL);
	return 0;
}
