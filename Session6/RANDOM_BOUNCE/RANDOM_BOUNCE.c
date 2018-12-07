#include "typedefs.h"





unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8 ;


void main() 
{
u8 i=0;
u8 dir=3;
s16 x=160;
s16 y=120;
u8 Value=0;
u16 pen_color[16]={CL_AQUA,CL_BLACK,CL_BLUE,CL_FUCHSIA,CL_GRAY,CL_GREEN,CL_LIME,CL_MAROON,CL_NAVY,CL_OLIVE,CL_PURPLE,CL_RED,CL_SILVER,CL_TEAL,CL_WHITE,CL_YELLOW
};


TFT_Init_ILI9341_8bit(320,240) ;

TFT_Set_Default_Mode()  ;

TFT_Fill_Screen(CL_YELLOW);


GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
GPIO_Digital_Input(&GPIOC_IDR,_GPIO_PINMASK_13);



while(1)
{


TFT_Set_Pen(pen_color[i],15)    ;
TFT_Circle(x,y,3);

if(dir==1)
{
  TFT_Set_Pen(CL_YELLOW,15)    ;
  TFT_Circle(x,y,3);
   x-=4;
   y+=1;
}

if(dir==2)
{
 TFT_Set_Pen(CL_YELLOW,15)    ;
  TFT_Circle(x,y,3);
  y-=3;
  x+=1;
}

if(dir==3)
{
 TFT_Set_Pen(CL_YELLOW,15)    ;
  TFT_Circle(x,y,3);
   y+=2;
   x+=1;
}

if(dir==4)
{
 TFT_Set_Pen(CL_YELLOW,15)    ;
  TFT_Circle(x,y,3);
   x+=2;
   y+=1;
}



 if(x>320)
 {
 dir = 1;

 }
 if(y>240)
 {

 dir = 2;

 }
 if(x<0)
 {
 dir = 3;

 }
if(y<0)
 {
 dir = 4;

 }

}

}