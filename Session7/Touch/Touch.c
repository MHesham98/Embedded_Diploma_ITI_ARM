#include "ALL.h"
u8 XStr[7];
u8 YStr[7];
unsigned int TFT_DataPort at GPIOE_ODR;
sbit TFT_WR at GPIOE_ODR.B11;
sbit TFT_RD at GPIOE_ODR.B10;
sbit TFT_CS at GPIOE_ODR.B15;
sbit TFT_RS at GPIOE_ODR.B12;
sbit TFT_RST at GPIOE_ODR.B8 ;

sbit DriveX_Left at GPIOB_ODR.B1;
sbit DriveX_Right at GPIOB_ODR.B8;
sbit DriveY_Up at GPIOB_ODR.B9;
sbit DriveY_Down at GPIOB_ODR.B0;

void main() 
{
u16 XPos;
u16 YPos;


UART1_Init(115200);
Delay_ms(100);

UART1_Write_Text(" Hello!");
UART1_Write(13);
UART1_Write(10);

//ADC Int
ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9)   ;
ADC1_Init();

//Screen Initilization
TFT_Init_ILI9341_8bit(320,240) ;
TFT_Set_Default_Mode()  ;
TFT_Fill_Screen(CL_WHITE);


//Touch Intilization

TP_TFT_Set_ADC_Threshold(750);

TP_TFT_Init(320,240,8,9)  ;

TP_TFT_Calibrate_Max();
TP_TFT_Calibrate_Min();

while(1)
{ if(TP_TFT_Press_Detect())
{
  TP_TFT_Get_Coordinates(&XPos,&YPos )       ;
  
  IntToStr(XPos,XStr);
  IntToStr(YPos,YStr);
  
  UART_Write_Text("X Coordinates ");

  UART1_Write_Text(XStr);
  
  UART_Write_Text("Y Coordinates ");
  
  UART1_Write_Text(YStr);
   while(TP_TFT_Press_Detect())
   {
   
   
   }
}


}

}