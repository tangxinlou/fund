#include<stdio.h>
#include<string.h>
void swap(char *head,char *tail)
{
	char t;
	while(head < tail)
	{
		t = *head;
		*head = *tail;
		*tail = t;
		head ++;
		tail --;
	}
}
//假设逆序后的字符串是 "   abc 123"
void word_swap(char *head)
{
	char *tail;
	while(*head != '\0')//因为可能有多个单词
	{
		while(*head == ' ')
			head ++;
		//循环退出时指向单词的第一个字母
		tail = head;	
		while(*tail != ' ' && *tail != '\0')
			tail ++;
		//循环退出时指向c后面的位置
		swap(head,tail - 1);
		head = tail;
	}

}

int main(int argc, const char *argv[])
{
	char word[100];
	
	gets(word);
	char *head = word;
	char *tail = word + strlen(word) - 1;

	swap(head,tail);//整体字符串逆序

	word_swap(word);
	
	puts(word);
	return 0;
}
