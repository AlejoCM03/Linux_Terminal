
#include<stdio.h>
#include<time.h>

int main()
{
	time_t t;
	time(&t);
	printf("%s\n", ctime(&t));

	struct tm *tiempo = localtime(&t);

	printf("%d/%d/%d",tiempo->tm_mday, tiempo->tm_mon+1, tiempo->tm_year+1900);
 
	return (0);
}


