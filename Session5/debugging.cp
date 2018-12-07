#line 1 "C:/Embedded/Session5/debugging.c"
#line 1 "c:/embedded/session5/typedefs.h"
 typedef unsigned short int u8;
 typedef signed short int s8;

 typedef unsigned int u16;
 typedef signed int s16;


 typedef unsigned long int u32;
 typedef signed long int s32;

 typedef float f32;
 typedef long double f64;
#line 3 "C:/Embedded/Session5/debugging.c"
void Toggle(int *ptr)
{int i;
 for(i=0;i<5;++i)
 {
 *ptr = 0x00;
 Delay_ms(500);
 *ptr = 0xff;
 Delay_ms(500);
 }
}




void TogglePin(int *ptr,u8 PIN)
{
 *ptr &= ~(1<<PIN);
 Delay_ms(500);
 *ptr |= (1<<PIN);
 Delay_ms(500);

}


void SetBit(int *ptr,u8 PIN)
{


 *ptr |= (1<<PIN);


}

void ClearBit(int *ptr,u8 PIN)
{


 *ptr &= ~(1<<PIN);


}

void SetPort(int *ptr)
{


 *ptr |= 0xFFFF;


}

void ClearPort(int *ptr)
{


 *ptr &= 0xFFFF;


}

void SetValue(s16 *ptr,u8 Value)
{
if(Value == 0)
{
 *ptr = 0;
}
else
{

 *ptr=0xffff;


}



}
