#include<stdio.h>
#include<time.h>
int main(int argc, const char *argv[])
{
	FILE *fp;

	fp = fopen("./log","w");
	
	time_t t;
	char *ptm;
//	struct tm *ptm;
	while(1)
	{
		t = time(NULL);
		ptm = ctime(&t);	
		fputs(ptm,fp);

	//	ptm = localtime(&t);
	//	fprintf(fp,"%d-%d-%d,%d:%d:%d\n",ptm->tm_year + 1900,ptm->tm_mon + 1,ptm->tm_mday,
	//			ptm->tm_hour,ptm->tm_min,ptm->tm_sec);

		fflush(fp);
		sleep(1);
	}

	return 0;
}
