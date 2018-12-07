_main:
;Touch.c,16 :: 		void main()
SUB	SP, SP, #4
;Touch.c,22 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;Touch.c,23 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main0:
SUBS	R7, R7, #1
BNE	L_main0
NOP
NOP
NOP
NOP
;Touch.c,25 :: 		UART1_Write_Text(" Hello!");
MOVW	R0, #lo_addr(?lstr1_Touch+0)
MOVT	R0, #hi_addr(?lstr1_Touch+0)
BL	_UART1_Write_Text+0
;Touch.c,26 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;Touch.c,27 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;Touch.c,30 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_8 | _ADC_CHANNEL_9)   ;
MOVW	R0, #768
BL	_ADC_Set_Input_Channel+0
;Touch.c,31 :: 		ADC1_Init();
BL	_ADC1_Init+0
;Touch.c,34 :: 		TFT_Init_ILI9341_8bit(320,240) ;
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;Touch.c,35 :: 		TFT_Set_Default_Mode()  ;
BL	_TFT_Set_Default_Mode+0
;Touch.c,36 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;Touch.c,41 :: 		TP_TFT_Set_ADC_Threshold(750);
MOVW	R0, #750
SXTH	R0, R0
BL	_TP_TFT_Set_ADC_Threshold+0
;Touch.c,43 :: 		TP_TFT_Init(320,240,8,9)  ;
MOVS	R3, #9
MOVS	R2, #8
MOVS	R1, #240
MOVW	R0, #320
BL	_TP_TFT_Init+0
;Touch.c,45 :: 		TP_TFT_Calibrate_Max();
BL	_TP_TFT_Calibrate_Max+0
;Touch.c,46 :: 		TP_TFT_Calibrate_Min();
BL	_TP_TFT_Calibrate_Min+0
;Touch.c,48 :: 		while(1)
L_main2:
;Touch.c,49 :: 		{ if(TP_TFT_Press_Detect())
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;Touch.c,51 :: 		TP_TFT_Get_Coordinates(&XPos,&YPos )       ;
ADD	R1, SP, #2
ADD	R0, SP, #0
BL	_TP_TFT_Get_Coordinates+0
;Touch.c,53 :: 		IntToStr(XPos,XStr);
MOVW	R1, #lo_addr(_XStr+0)
MOVT	R1, #hi_addr(_XStr+0)
LDRH	R0, [SP, #0]
BL	_IntToStr+0
;Touch.c,54 :: 		IntToStr(YPos,YStr);
MOVW	R1, #lo_addr(_YStr+0)
MOVT	R1, #hi_addr(_YStr+0)
LDRH	R0, [SP, #2]
BL	_IntToStr+0
;Touch.c,56 :: 		UART_Write_Text("X Coordinates ");
MOVW	R0, #lo_addr(?lstr2_Touch+0)
MOVT	R0, #hi_addr(?lstr2_Touch+0)
BL	_UART_Write_Text+0
;Touch.c,58 :: 		UART1_Write_Text(XStr);
MOVW	R0, #lo_addr(_XStr+0)
MOVT	R0, #hi_addr(_XStr+0)
BL	_UART1_Write_Text+0
;Touch.c,60 :: 		UART_Write_Text("Y Coordinates ");
MOVW	R0, #lo_addr(?lstr3_Touch+0)
MOVT	R0, #hi_addr(?lstr3_Touch+0)
BL	_UART_Write_Text+0
;Touch.c,62 :: 		UART1_Write_Text(YStr);
MOVW	R0, #lo_addr(_YStr+0)
MOVT	R0, #hi_addr(_YStr+0)
BL	_UART1_Write_Text+0
;Touch.c,63 :: 		while(TP_TFT_Press_Detect())
L_main5:
BL	_TP_TFT_Press_Detect+0
CMP	R0, #0
IT	EQ
BEQ	L_main6
;Touch.c,67 :: 		}
IT	AL
BAL	L_main5
L_main6:
;Touch.c,68 :: 		}
L_main4:
;Touch.c,71 :: 		}
IT	AL
BAL	L_main2
;Touch.c,73 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
