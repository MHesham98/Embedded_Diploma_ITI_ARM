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

u32 result;

void calcPower(u32 base,u32 power)
{
	int i;
	result=1;
	for(i=1;i<=power;++i)
	{
		result*=base;
		
	}
	return;
}