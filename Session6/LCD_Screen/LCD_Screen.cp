#line 1 "C:/Embedded/Session6/LCD_Screen/LCD_Screen.c"
#line 1 "c:/embedded/session6/lcd_screen/typedefs.h"
 typedef unsigned short int u8;
 typedef signed short int s8;

 typedef unsigned int u16;
 typedef signed int s16;


 typedef unsigned long int u32;
 typedef signed long int s32;

 typedef float f32;
 typedef long double f64;
#line 1 "c:/embedded/session6/lcd_screen/defines.h"
#line 3 "C:/Embedded/Session6/LCD_Screen/LCD_Screen.c"
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8 ;

void main()
{

u8 i=0;
s16 x=160;
s16 y=120;
u16 pen_color[16]={CL_AQUA,CL_BLACK,CL_BLUE,CL_FUCHSIA,CL_GRAY,CL_GREEN,CL_LIME,CL_MAROON,CL_NAVY,CL_OLIVE,CL_PURPLE,CL_RED,CL_SILVER,CL_TEAL,CL_WHITE,CL_YELLOW
};
TFT_Init_ILI9341_8bit(320,240) ;

TFT_Set_Default_Mode() ;

TFT_Fill_Screen(CL_YELLOW);


GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
GPIO_Digital_Input(&GPIOC_IDR,_GPIO_PINMASK_13);




while(1)
{
TFT_Set_Pen(pen_color[i],15) ;
TFT_Circle(x,y,3);
if(Button(&GPIOC_IDR,13, 30 , 0 )==255)
{
 i++;
 if(i==17)
 {i=0;}
 TFT_Set_Pen(pen_color[i],15);
 TFT_Circle(x,y,3);
 while(Button(&GPIOC_IDR,13, 30 , 0 )==255)
 {
 }

}
if(Button(&GPIOD_IDR, 4 , 30 , 0 )==255)
{
TFT_Set_Pen(CL_YELLOW,15) ;
TFT_Circle(x,y,3);
 y-=5;
}


if(Button(&GPIOB_IDR, 5 , 30 , 0 )==255)
{
TFT_Set_Pen(CL_YELLOW,15) ;
TFT_Circle(x,y,3);
 y+=5;
}



if(Button(&GPIOA_IDR, 6 , 30 , 0 )==255)
{
TFT_Set_Pen(CL_YELLOW,15) ;
TFT_Circle(x,y,3);
 x+=5;
}



if(Button(&GPIOD_IDR, 2 , 30 , 0 )==255)
{
TFT_Set_Pen(CL_YELLOW,15) ;
TFT_Circle(x,y,3);
 x-=5;
}


 if(x>320)
 {
 x=0;

 }
 if(y>240)
 {

 y=0;

 }
 if(x<0)
 {
 x=320;

 }
 if(y<0)
 {
 y=240;

 }
}
return;
}
