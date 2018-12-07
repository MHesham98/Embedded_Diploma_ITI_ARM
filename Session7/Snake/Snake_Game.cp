#line 1 "C:/Embedded/Session7/Snake/Snake_Game.c"
#line 1 "c:/embedded/session7/snake/all.h"
 typedef unsigned short int u8;
 typedef signed short int s8;

 typedef unsigned int u16;
 typedef signed int s16;


 typedef unsigned long int u32;
 typedef signed long int s32;

 typedef float f32;
 typedef long double f64;









void Draw(s16 x,s16 y);
void Clear(s16 x,s16 y);
#line 3 "C:/Embedded/Session7/Snake/Snake_Game.c"
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8 ;



void main()
{


u8 i;


s16 IntX = 160;
s16 IntY = 120;


u8 NumberOfDots = 3;
s16 HeadXPos = IntX;
s16 HeadYPos = IntY;
u8 Dir = 1;


TFT_Init_ILI9341_8bit(320,240) ;
TFT_Set_Default_Mode() ;
TFT_Fill_Screen(CL_WHITE);


GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
GPIO_Digital_Input(&GPIOC_IDR,_GPIO_PINMASK_13);





while(1)
{
if(Button(&GPIOD_IDR, 4 , 30 , 0 )==255)
{
 Dir = 1;
}
if(Button(&GPIOD_IDR, 2 , 30 , 0 )==255)
{
 Dir = 2;
}
if(Button(&GPIOB_IDR, 5 , 30 , 0 )==255)
{
 Dir = 3;
}
if(Button(&GPIOA_IDR, 6 , 30 , 0 )==255)
{
 Dir = 4;
}



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
