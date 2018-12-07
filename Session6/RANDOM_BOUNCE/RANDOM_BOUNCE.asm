_main:
;RANDOM_BOUNCE.c,15 :: 		void main()
SUB	SP, SP, #40
;RANDOM_BOUNCE.c,17 :: 		u8 i=0;
ADD	R11, SP, #4
ADD	R10, R11, #34
MOVW	R12, #lo_addr(?ICSmain_i_L0+0)
MOVT	R12, #hi_addr(?ICSmain_i_L0+0)
BL	___CC2DW+0
;RANDOM_BOUNCE.c,18 :: 		u8 dir=3;
;RANDOM_BOUNCE.c,21 :: 		u8 Value=0;
;RANDOM_BOUNCE.c,23 :: 		};
;RANDOM_BOUNCE.c,26 :: 		TFT_Init_ILI9341_8bit(320,240) ;
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;RANDOM_BOUNCE.c,28 :: 		TFT_Set_Default_Mode()  ;
BL	_TFT_Set_Default_Mode+0
;RANDOM_BOUNCE.c,30 :: 		TFT_Fill_Screen(CL_YELLOW);
MOVW	R0, #65504
BL	_TFT_Fill_Screen+0
;RANDOM_BOUNCE.c,33 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;RANDOM_BOUNCE.c,34 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;RANDOM_BOUNCE.c,35 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;RANDOM_BOUNCE.c,36 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;RANDOM_BOUNCE.c,37 :: 		GPIO_Digital_Input(&GPIOC_IDR,_GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_GPIO_Digital_Input+0
;RANDOM_BOUNCE.c,40 :: 		x = abs(x)/10;
LDRSH	R0, [SP, #0]
BL	_abs+0
MOVS	R1, #10
SXTH	R1, R1
SDIV	R0, R0, R1
STRH	R0, [SP, #0]
;RANDOM_BOUNCE.c,41 :: 		y= abs(y)/50;
LDRSH	R0, [SP, #2]
BL	_abs+0
MOVS	R1, #50
SXTH	R1, R1
SDIV	R0, R0, R1
STRH	R0, [SP, #2]
;RANDOM_BOUNCE.c,42 :: 		while(1)
L_main0:
;RANDOM_BOUNCE.c,46 :: 		TFT_Set_Pen(pen_color[i],15)    ;
ADD	R1, SP, #6
LDRB	R0, [SP, #4]
LSLS	R0, R0, #1
ADDS	R0, R1, R0
LDRH	R0, [R0, #0]
MOVS	R1, #15
BL	_TFT_Set_Pen+0
;RANDOM_BOUNCE.c,47 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #2]
LDRSH	R0, [SP, #0]
BL	_TFT_Circle+0
;RANDOM_BOUNCE.c,49 :: 		if(dir==1)
LDRB	R0, [SP, #5]
CMP	R0, #1
IT	NE
BNE	L_main2
;RANDOM_BOUNCE.c,51 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;RANDOM_BOUNCE.c,52 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #2]
LDRSH	R0, [SP, #0]
BL	_TFT_Circle+0
;RANDOM_BOUNCE.c,53 :: 		x-=4;
LDRSH	R0, [SP, #0]
SUBS	R0, R0, #4
STRH	R0, [SP, #0]
;RANDOM_BOUNCE.c,54 :: 		y+=1;
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #1
STRH	R0, [SP, #2]
;RANDOM_BOUNCE.c,55 :: 		}
L_main2:
;RANDOM_BOUNCE.c,57 :: 		if(dir==2)
LDRB	R0, [SP, #5]
CMP	R0, #2
IT	NE
BNE	L_main3
;RANDOM_BOUNCE.c,59 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;RANDOM_BOUNCE.c,60 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #2]
LDRSH	R0, [SP, #0]
BL	_TFT_Circle+0
;RANDOM_BOUNCE.c,61 :: 		y-=3;
LDRSH	R0, [SP, #2]
SUBS	R0, R0, #3
STRH	R0, [SP, #2]
;RANDOM_BOUNCE.c,62 :: 		x+=1;
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
STRH	R0, [SP, #0]
;RANDOM_BOUNCE.c,63 :: 		}
L_main3:
;RANDOM_BOUNCE.c,65 :: 		if(dir==3)
LDRB	R0, [SP, #5]
CMP	R0, #3
IT	NE
BNE	L_main4
;RANDOM_BOUNCE.c,67 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;RANDOM_BOUNCE.c,68 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #2]
LDRSH	R0, [SP, #0]
BL	_TFT_Circle+0
;RANDOM_BOUNCE.c,69 :: 		y+=2;
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #2
STRH	R0, [SP, #2]
;RANDOM_BOUNCE.c,70 :: 		x+=1;
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
STRH	R0, [SP, #0]
;RANDOM_BOUNCE.c,71 :: 		}
L_main4:
;RANDOM_BOUNCE.c,73 :: 		if(dir==4)
LDRB	R0, [SP, #5]
CMP	R0, #4
IT	NE
BNE	L_main5
;RANDOM_BOUNCE.c,75 :: 		TFT_Set_Pen(CL_YELLOW,15)    ;
MOVS	R1, #15
MOVW	R0, #65504
BL	_TFT_Set_Pen+0
;RANDOM_BOUNCE.c,76 :: 		TFT_Circle(x,y,3);
MOVS	R2, #3
SXTH	R2, R2
LDRSH	R1, [SP, #2]
LDRSH	R0, [SP, #0]
BL	_TFT_Circle+0
;RANDOM_BOUNCE.c,77 :: 		x+=2;
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #2
STRH	R0, [SP, #0]
;RANDOM_BOUNCE.c,78 :: 		y+=1;
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #1
STRH	R0, [SP, #2]
;RANDOM_BOUNCE.c,79 :: 		}
L_main5:
;RANDOM_BOUNCE.c,83 :: 		if(x>320)
LDRSH	R0, [SP, #0]
CMP	R0, #320
IT	LE
BLE	L_main6
;RANDOM_BOUNCE.c,85 :: 		dir = 1;
MOVS	R0, #1
STRB	R0, [SP, #5]
;RANDOM_BOUNCE.c,87 :: 		}
L_main6:
;RANDOM_BOUNCE.c,88 :: 		if(y>240)
LDRSH	R0, [SP, #2]
CMP	R0, #240
IT	LE
BLE	L_main7
;RANDOM_BOUNCE.c,91 :: 		dir = 2;
MOVS	R0, #2
STRB	R0, [SP, #5]
;RANDOM_BOUNCE.c,93 :: 		}
L_main7:
;RANDOM_BOUNCE.c,94 :: 		if(x<0)
LDRSH	R0, [SP, #0]
CMP	R0, #0
IT	GE
BGE	L_main8
;RANDOM_BOUNCE.c,96 :: 		dir = 3;
MOVS	R0, #3
STRB	R0, [SP, #5]
;RANDOM_BOUNCE.c,98 :: 		}
L_main8:
;RANDOM_BOUNCE.c,99 :: 		if(y<0)
LDRSH	R0, [SP, #2]
CMP	R0, #0
IT	GE
BGE	L_main9
;RANDOM_BOUNCE.c,101 :: 		dir = 4;
MOVS	R0, #4
STRB	R0, [SP, #5]
;RANDOM_BOUNCE.c,103 :: 		}
L_main9:
;RANDOM_BOUNCE.c,105 :: 		}
IT	AL
BAL	L_main0
;RANDOM_BOUNCE.c,107 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
