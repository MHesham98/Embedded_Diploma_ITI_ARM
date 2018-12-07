#include "typedefs.h"
#include <stdlib.h>
#include "Defs.h"


void main() {
//Intilizations
u16 adcValue;
u16  BuzzerFrequency;
u8 COUNT;
u8 HEIGHT=1;
u8 i;
char arr[7] = {sizeof(char),sizeof(int),sizeof(short int),sizeof(long int),sizeof(float),sizeof(double),sizeof(long double)} ;
//   char 1 Byte ,short 1 Byte,int 2 byte,long int 4byte,float 4 bytes,double 4 bytes,long double 8byte


//Adc Initilization

//t3refat D
GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);


GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);

ADC_Set_Input_Channel(_ADC_CHANNEL_3);

ADC1_Init();

//Buzzer Int
GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_14);
GPIOE_ODR =0;

GPIOD_ODR =0;
//Infinite Loop
  
  while(1)
  {


  GPIOD_ODR =0;
  adcValue = ADC1_Get_Sample(3);
  BuzzerFrequency=2000+(adcValue*2000/4096.0);


  COUNT = adcValue/1023;
  BuzzerOn(BuzzerFrequency,0.5);
  for(i=0;i<COUNT;i++)
  {
  
  GPIOD_ODR |= (1<<4*i)<<COUNT-1;
  
  }
  


    /*i=0;
    VarSize(arr[i]);
    Toggle(&GPIOA_ODR);
    Delay_ms(2000);
    i++;
    VarSize(arr[i]);
    Toggle(&GPIOA_ODR);
    Delay_ms(2000);
    i++;
    VarSize(arr[i]);
    Toggle(&GPIOA_ODR);
    Delay_ms(2000);
    i++;
    VarSize(arr[i]);
    Toggle(&GPIOA_ODR);
    Delay_ms(2000);
    i++;
    VarSize(arr[i]);
    Toggle(&GPIOA_ODR);
    Delay_ms(2000);
    i++;
    VarSize(arr[i]);
    Toggle(&GPIOA_ODR);
    Delay_ms(2000);
    VarSize(arr[i]);
    Toggle(&GPIOA_ODR);
    Delay_ms(2000);*/
  }

  return;
}


void VarSize(char SIZE)
{
char i=0;
GPIOD_ODR=0;
for(i=0;i<SIZE;i++)
{
  GPIOD_ODR |= (1<<i);
}
}



void BuzzerOn(u32 frequency,f32 DutyCycle)
{
 u16 i;
 u8 j;
 f32 PeriodicTime;
 f32 T_ON;
 f32 T_OFF;
 f32 CYCLES;
 PeriodicTime = 1000.0/frequency;
 T_ON = PeriodicTime * DutyCycle;
 T_OFF = PeriodicTime - T_ON;
 

 

   //Start Buzzer
   GPIOE_ODR |= (1<<14);
   for(i=0;i<T_ON*1000;++i)
   {
   Delay_us(1);
   }
   //Close Buzzer
   GPIOE_ODR &= ~(1<<14);
   for(i=0;i<T_OFF*1000;i++)
   {
   Delay_us(1);
   }







 return;
}