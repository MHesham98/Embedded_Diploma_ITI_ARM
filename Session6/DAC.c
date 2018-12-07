#include "typedefs.h"
void main()
{
//Intilization
u16 i;
GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
DAC1_Init( _DAC_CH1_ENABLE);
i=0;
//Infinite Loop
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