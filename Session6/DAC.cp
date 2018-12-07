#line 1 "C:/Embedded/Session6/DAC.c"
#line 1 "c:/embedded/session6/typedefs.h"
 typedef unsigned short int u8;
 typedef signed short int s8;

 typedef unsigned int u16;
 typedef signed int s16;


 typedef unsigned long int u32;
 typedef signed long int s32;

 typedef float f32;
 typedef long double f64;
#line 2 "C:/Embedded/Session6/DAC.c"
void main()
{

u16 i;
GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
DAC1_Init( _DAC_CH1_ENABLE);
i=0;

while(1)
{
 if(i==4096)
 {
 i=0;
 }

DAC1_Ch1_Output(i);
Delay_ms(1);
i++;



}
return;
}
