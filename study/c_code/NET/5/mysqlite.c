#include<stdio.h>
#include<sqlite3.h>

int mycallback(void *arg,int n,char **f_value,char **f_name)
{
	int i;
	
	if(*(int *)arg == 1)
	{
		for(i = 0;i < n;i ++)
		{
			printf("%s ",f_name[i]);
		}
		printf("\n");
		*(int *)arg = 0;
	}
	for(i = 0;i < n;i ++)
	{
		printf("%s ",f_value[i]);
	}
	printf("\n");
	sleep(1);
	return 0;
}

int main(int argc, const char *argv[])
{
	sqlite3 *db;
	if(sqlite3_open("./my.db",&db) != SQLITE_OK)
	{
		printf("%s\n",sqlite3_errmsg(db));
		return -1;
	}

	char sqlopt[128];
	sprintf(sqlopt,"create table stu(name,score);");//将命令添加到sqlopt数组中

	char *errmsg;
	if(sqlite3_exec(db,sqlopt,NULL,NULL,&errmsg) != SQLITE_OK)
	{
		printf("%s\n",errmsg);
		//		return -1;
	}

	int i;
	char buf[64];
	int data;
	for(i = 0;i < 2;i ++)
	{
		scanf("%s%d",buf,&data);
		sprintf(sqlopt,"insert into stu values('%s',%d);",buf,data);

		sqlite3_exec(db,sqlopt,NULL,NULL,NULL);
	}

	int ctl = 1;
//	sprintf(sqlopt,"select * from stu;");
	sprintf(sqlopt,"select * from stu where name='lxs';");
	if(sqlite3_exec(db,sqlopt,mycallback,&ctl,&errmsg) != SQLITE_OK)
	{
		printf("%s\n",errmsg);
		return -1;
	}

	char **value;
	int r;
	int c;
//	sprintf(sqlopt,"select * from stu;");
	sprintf(sqlopt,"select * from stu where name='lxs';");
	if(sqlite3_get_table(db,sqlopt,&value,&r,&c,&errmsg) != SQLITE_OK)
	{
		printf("%s\n",errmsg);
		return -1;
	}
	printf("r = %d,c = %d\n",r,c);


	//显示所有的属性内容
	for(i = 0;i < c;i ++)
	{
		printf("%s\t",value[i]);
	}
	printf("\n");

	int count = 0;
	for(i = c;i < (r + 1) * c;i ++)
	{
		count ++;
		printf("%s\t",value[i]);
		if(count % c == 0)
			printf("\n");
	}
	return 0;
}
