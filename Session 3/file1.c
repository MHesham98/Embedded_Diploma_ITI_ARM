#include <stdio.h>


typedef unsigned char u8;
typedef signed char s8;

typedef unsigned short int u16;
typedef signed short int s16;

typedef unsigned long int u32;
typedef signed long int s32;

typedef float f32;

typedef double f64;

typedef long double f128; 

u8 Count(void)
{
	static u8 counter=0;
	
	++counter;
	
	return counter;
}


