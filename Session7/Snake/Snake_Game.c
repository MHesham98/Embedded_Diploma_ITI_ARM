#include "ALL.h"

unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8 ;



void main()
{
//Intialization

u8 i;

//Intial Position
s16 IntX = 160;
s16 IntY = 120;

//Snake Intilization
u8 NumberOfDots = 3;
s16 HeadXPos = IntX;
s16 HeadYPos = IntY;
u8 Dir = 1;  // 1 - UP    2 - LEFT     3 - DOWN    4  -  RIGHT

//Screen Initilization
TFT_Init_ILI9341_8bit(320,240) ;
TFT_Set_Default_Mode()  ;
TFT_Fill_Screen(CL_WHITE);

//JOYSTICK Initilization
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
GPIO_Digital_Input(&GPIOC_IDR,_GPIO_PINMASK_13);




//Infinite Loop
while(1)
{
if(Button(&GPIOD_IDR,PINUP,DELAY,ACTIVE_STATE)==255)
{
  Dir = 1;
}
if(Button(&GPIOD_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
{
  Dir = 2;
}
if(Button(&GPIOB_IDR,PINDOWN,DELAY,ACTIVE_STATE)==255)
{
  Dir = 3;
}
if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
{
  Dir = 4;
}

//Automatic Movement

if(Dir == 1)
{

  HeadYPos = HeadYPos-16;
  Draw(HeadXPos,HeadYPos);
  Clear(HeadXPos,HeadYPos+((NumberOfDots)*16));

  Clear(HeadXPos+((NumberOfDots)*8),HeadYPos+12);
  Clear(HeadXPos-((NumberOfDots)*8),HeadYPos+12);
  Clear(HeadXPos+((NumberOfDots)*8),HeadYPos+20);
  Clear(HeadXPos-((NumberOfDots)*8),HeadYPos+20);

  Delay_ms(500);
  


}

if(Dir == 2)
{

    HeadXPos = HeadXPos-16;
    Draw(HeadXPos,HeadYPos);
    Clear(HeadXPos+(NumberOfDots*16),HeadYPos);
    
    Clear(HeadXPos+12,HeadYPos+(NumberOfDots*8));
    Clear(HeadXPos+12,HeadYPos-(NumberOfDots*8));
    Clear(HeadXPos+20,HeadYPos+(NumberOfDots*8));
    Clear(HeadXPos+20,HeadYPos-(NumberOfDots*8));

    Delay_ms(500);



}

if(Dir == 3)
{

    HeadYPos = HeadYPos+16;
    Draw(HeadXPos,HeadYPos);
    Clear(HeadXPos,HeadYPos-(NumberOfDots*16));

     Clear(HeadXPos+((NumberOfDots)*8),HeadYPos-12);
     Clear(HeadXPos-((NumberOfDots)*8),HeadYPos-12);
     Clear(HeadXPos+((NumberOfDots)*8),HeadYPos-20);
     Clear(HeadXPos-((NumberOfDots)*8),HeadYPos-20);
  
    Delay_ms(500);


}

if(Dir == 4)
{


     HeadXPos = HeadXPos+16 ;
     Draw(HeadXPos,HeadYPos);
     Clear(HeadXPos-(NumberOfDots*16),HeadYPos);

     Clear(HeadXPos-12,HeadYPos+(NumberOfDots*8));
     Clear(HeadXPos-12,HeadYPos-(NumberOfDots*8));
     Clear(HeadXPos-20,HeadYPos+(NumberOfDots*8));
     Clear(HeadXPos-20,HeadYPos-(NumberOfDots*8));
     
     Delay_ms(500);


}



}
return;
}



void Draw(s16 x,s16 y)
{
 TFT_Set_Pen(CL_BLACK,15);
 TFT_Circle(x,y,2);
}

void Clear(s16 x,s16 y)
{
 TFT_Set_Pen(CL_WHITE,15);
 TFT_Circle(x,y,2);
}