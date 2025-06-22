//自定义的头文件包含:系统头文件、宏定义、函数声明、结构体或共用体声明

#ifndef _STU_H_  //当多次应用同一个头文件时不会报错
#define _STU_H_

#include<stdio.h>
struct stu //一个结构体代表一个人 
{
	char name[15];
	int id;
	int age;
	int score;
};

extern void input_info(struct stu *p);
extern void sort_info(struct stu *p);
extern void output_info(struct stu *p);
#endif
