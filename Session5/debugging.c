#include "typedefs.h"

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




