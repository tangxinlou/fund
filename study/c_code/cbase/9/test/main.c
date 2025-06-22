#include "head.h"

int main(int argc, const char *argv[])
{
	struct stu student[3];	

	input_info(student);
	sort_info(student);
	output_info(student);

	return 0;
}
