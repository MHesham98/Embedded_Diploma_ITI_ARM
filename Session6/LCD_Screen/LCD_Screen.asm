_main:
;LCD_Screen.c,10 :: 		void main()
SUB	SP, SP, #40
;LCD_Screen.c,13 :: 		u8 i=0;
ADD	R11, SP, #0
ADD	R10, R11, #38
MOVW	R12, #lo_addr(?ICSmain_i_L0+0)
MOVT	R12, #hi_addr(?ICSmain_i_L0+0)
BL	___CC2DW+0
;LCD_Screen.c,14 :: 		s16 x=160;
;LCD_Screen.c,15 :: 		s16 y=120;
;LCD_Screen.c,17 :: 		};
;LCD_Screen.c,18 :: 		TFT_Init_ILI9341_8bit(320,240) ;
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;LCD_Screen.c,20 :: 		TFT_Set_Default_Mode()  ;
BL	_TFT_Set_Default_Mode+0
;LCD_Screen.c,22 :: 		TFT_Fill_Screen(CL_YELLOW);
MOVW	R0, #65504
BL	_TFT_Fill_Screen+0
;LCD_Screen.c,25 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;LCD_Screen.c,26 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;LCD_Screen.c,27 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;LCD_Screen.c,28 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;LCD_Screen.c,29 :: 		GPIO_Digital_Input(&GPIOC_IDR,_GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_GPIO_Digital_Input+0
;LCD_Screen.c,34 :: 		while(1)
L_main0:
;LCD_Screen.c,36 :: 		TFT_Set_Pen(pen_color[i],15)    ;
ADD	R1, SP, #6
LDRB	R0, [SP, #0]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
MOVS	R1, #15
BL	_TFT_Set_Pen+0
;LCD_Screen.c,37 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #4]
LDRSH	R0, [SP, #2]
BL	_TFT_Circle+0
;LCD_Screen.c,38 :: 		if(Button(&GPIOC_IDR,13,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #13
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main2
;LCD_Screen.c,40 :: 		i++;
LDRB	R0, [SP, #0]
ADDS	R0, R0, #1
UXTB	R0, R0
STRB	R0, [SP, #0]
;LCD_Screen.c,41 :: 		if(i==17)
CMP	R0, #17
IT	NE
BNE	L_main3
;LCD_Screen.c,42 :: 		{i=0;}
MOVS	R0, #0
STRB	R0, [SP, #0]
L_main3:
;LCD_Screen.c,43 :: 		TFT_Set_Pen(pen_color[i],15);
ADD	R1, SP, #6
LDRB	R0, [SP, #0]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
MOVS	R1, #15
BL	_TFT_Set_Pen+0
;LCD_Screen.c,44 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #4]
LDRSH	R0, [SP, #2]
BL	_TFT_Circle+0
;LCD_Screen.c,45 :: 		while(Button(&GPIOC_IDR,13,DELAY,ACTIVE_STATE)==255)
L_main4:
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #13
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main5
;LCD_Screen.c,47 :: 		}
IT	AL
BAL	L_main4
L_main5:
;LCD_Screen.c,49 :: 		}
L_main2:
;LCD_Screen.c,50 :: 		if(Button(&GPIOD_IDR,PINUP,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main6
;LCD_Screen.c,52 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;LCD_Screen.c,53 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #4]
LDRSH	R0, [SP, #2]
BL	_TFT_Circle+0
;LCD_Screen.c,54 :: 		y-=5;
LDRSH	R0, [SP, #4]
SUBS	R0, R0, #5
STRH	R0, [SP, #4]
;LCD_Screen.c,55 :: 		}
L_main6:
;LCD_Screen.c,58 :: 		if(Button(&GPIOB_IDR,PINDOWN,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main7
;LCD_Screen.c,60 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;LCD_Screen.c,61 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #4]
LDRSH	R0, [SP, #2]
BL	_TFT_Circle+0
;LCD_Screen.c,62 :: 		y+=5;
LDRSH	R0, [SP, #4]
ADDS	R0, R0, #5
STRH	R0, [SP, #4]
;LCD_Screen.c,63 :: 		}
L_main7:
;LCD_Screen.c,67 :: 		if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main8
;LCD_Screen.c,69 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;LCD_Screen.c,70 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #4]
LDRSH	R0, [SP, #2]
BL	_TFT_Circle+0
;LCD_Screen.c,71 :: 		x+=5;
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #5
STRH	R0, [SP, #2]
;LCD_Screen.c,72 :: 		}
L_main8:
;LCD_Screen.c,76 :: 		if(Button(&GPIOD_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main9
;LCD_Screen.c,78 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;LCD_Screen.c,79 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #4]
LDRSH	R0, [SP, #2]
BL	_TFT_Circle+0
;LCD_Screen.c,80 :: 		x-=5;
LDRSH	R0, [SP, #2]
SUBS	R0, R0, #5
STRH	R0, [SP, #2]
;LCD_Screen.c,81 :: 		}
L_main9:
;LCD_Screen.c,84 :: 		if(x>320)
LDRSH	R0, [SP, #2]
CMP	R0, #320
IT	LE
BLE	L_main10
;LCD_Screen.c,86 :: 		x=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
;LCD_Screen.c,88 :: 		}
L_main10:
;LCD_Screen.c,89 :: 		if(y>240)
LDRSH	R0, [SP, #4]
CMP	R0, #240
IT	LE
BLE	L_main11
;LCD_Screen.c,92 :: 		y=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #4]
;LCD_Screen.c,94 :: 		}
L_main11:
;LCD_Screen.c,95 :: 		if(x<0)
LDRSH	R0, [SP, #2]
CMP	R0, #0
IT	GE
BGE	L_main12
;LCD_Screen.c,97 :: 		x=320;
MOVW	R0, #320
SXTH	R0, R0
STRH	R0, [SP, #2]
;LCD_Screen.c,99 :: 		}
L_main12:
;LCD_Screen.c,100 :: 		if(y<0)
LDRSH	R0, [SP, #4]
CMP	R0, #0
IT	GE
BGE	L_main13
;LCD_Screen.c,102 :: 		y=240;
MOVS	R0, #240
SXTH	R0, R0
STRH	R0, [SP, #4]
;LCD_Screen.c,104 :: 		}
L_main13:
;LCD_Screen.c,105 :: 		}
IT	AL
BAL	L_main0
;LCD_Screen.c,107 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
