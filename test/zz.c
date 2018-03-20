#include <stdio.h>

int add(int i, int j);

int add(int i, int j)
{
	int n = 0 ; 
	n = i + j;
	return n;
}

int ddd(int d1, int d2, int d3, int d4, int d5, int d6, int d7, int d8, int d9)
{
	return 0;
}


int main()
{
	int a = 1;
	int b = 2;
	int r = add(a, b);

	if ( a > b )
	  r = 100;
	else
	  r = 128;

	printf("%d", r);

	return 0;
}
