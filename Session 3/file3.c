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

extern u32 result;

u8 Count(void);
void calcPower(u32 base,u32 power);
void printPower(void);

void main(void)
{
	u32 x,y;
	
	x=2;
	y=0;
	
	
	while(Count()<20)
	{
		calcPower(x,y+Count());
		printPower();
		
	}
	
	
	
	return;
}