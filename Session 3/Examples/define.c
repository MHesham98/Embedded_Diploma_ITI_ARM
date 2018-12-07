#include <stdio.h>
#include "def.h"

//#define x 10
#define y 20

#ifdef x
printf("defined");
#elif y
	printf("Not defined")
#endif

void main(void)
{
	int z = x+y;
	
	printf("X is %d",x);
	printf("Y is %d",y);
	
	
	printf("Z is %d",z);
	
	return;
}