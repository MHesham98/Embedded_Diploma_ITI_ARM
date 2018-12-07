_main:
;Snake_Game.c,12 :: 		void main()
SUB	SP, SP, #8
;Snake_Game.c,19 :: 		s16 IntX = 160;
; IntX start address is: 4 (R1)
MOVW	R1, #160
SXTH	R1, R1
;Snake_Game.c,20 :: 		s16 IntY = 120;
; IntY start address is: 8 (R2)
MOVW	R2, #120
SXTH	R2, R2
;Snake_Game.c,23 :: 		u8 NumberOfDots = 3;
MOVS	R0, #3
STRB	R0, [SP, #4]
;Snake_Game.c,24 :: 		s16 HeadXPos = IntX;
STRH	R1, [SP, #0]
; IntX end address is: 4 (R1)
;Snake_Game.c,25 :: 		s16 HeadYPos = IntY;
STRH	R2, [SP, #2]
; IntY end address is: 8 (R2)
;Snake_Game.c,26 :: 		u8 Dir = 1;  // 1 - UP    2 - LEFT     3 - DOWN    4  -  RIGHT
MOVS	R0, #1
STRB	R0, [SP, #5]
;Snake_Game.c,29 :: 		TFT_Init_ILI9341_8bit(320,240) ;
MOVS	R1, #240
MOVW	R0, #320
BL	_TFT_Init_ILI9341_8bit+0
;Snake_Game.c,30 :: 		TFT_Set_Default_Mode()  ;
BL	_TFT_Set_Default_Mode+0
;Snake_Game.c,31 :: 		TFT_Fill_Screen(CL_WHITE);
MOVW	R0, #65535
BL	_TFT_Fill_Screen+0
;Snake_Game.c,34 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;Snake_Game.c,35 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;Snake_Game.c,36 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;Snake_Game.c,37 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;Snake_Game.c,38 :: 		GPIO_Digital_Input(&GPIOC_IDR,_GPIO_PINMASK_13);
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_IDR+0)
MOVT	R0, #hi_addr(GPIOC_IDR+0)
BL	_GPIO_Digital_Input+0
;Snake_Game.c,44 :: 		while(1)
L_main0:
;Snake_Game.c,46 :: 		if(Button(&GPIOD_IDR,PINUP,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main2
;Snake_Game.c,48 :: 		Dir = 1;
MOVS	R0, #1
STRB	R0, [SP, #5]
;Snake_Game.c,49 :: 		}
L_main2:
;Snake_Game.c,50 :: 		if(Button(&GPIOD_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main3
;Snake_Game.c,52 :: 		Dir = 2;
MOVS	R0, #2
STRB	R0, [SP, #5]
;Snake_Game.c,53 :: 		}
L_main3:
;Snake_Game.c,54 :: 		if(Button(&GPIOB_IDR,PINDOWN,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main4
;Snake_Game.c,56 :: 		Dir = 3;
MOVS	R0, #3
STRB	R0, [SP, #5]
;Snake_Game.c,57 :: 		}
L_main4:
;Snake_Game.c,58 :: 		if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main5
;Snake_Game.c,60 :: 		Dir = 4;
MOVS	R0, #4
STRB	R0, [SP, #5]
;Snake_Game.c,61 :: 		}
L_main5:
;Snake_Game.c,65 :: 		if(Dir == 1)
LDRB	R0, [SP, #5]
CMP	R0, #1
IT	NE
BNE	L_main6
;Snake_Game.c,68 :: 		HeadYPos = HeadYPos-16;
LDRSH	R0, [SP, #2]
SUBS	R0, #16
STRH	R0, [SP, #2]
;Snake_Game.c,69 :: 		Draw(HeadXPos,HeadYPos);
SXTH	R1, R0
LDRSH	R0, [SP, #0]
BL	_Draw+0
;Snake_Game.c,70 :: 		Clear(HeadXPos,HeadYPos+((NumberOfDots)*16));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #4
SXTH	R1, R1
LDRSH	R0, [SP, #2]
ADDS	R0, R0, R1
SXTH	R1, R0
LDRSH	R0, [SP, #0]
BL	_Clear+0
;Snake_Game.c,72 :: 		Clear(HeadXPos+((NumberOfDots)*8),HeadYPos+12);
LDRSH	R0, [SP, #2]
ADDW	R2, R0, #12
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
ADDS	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,73 :: 		Clear(HeadXPos-((NumberOfDots)*8),HeadYPos+12);
LDRSH	R0, [SP, #2]
ADDW	R2, R0, #12
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
SUB	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,74 :: 		Clear(HeadXPos+((NumberOfDots)*8),HeadYPos+20);
LDRSH	R0, [SP, #2]
ADDW	R2, R0, #20
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
ADDS	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,75 :: 		Clear(HeadXPos-((NumberOfDots)*8),HeadYPos+20);
LDRSH	R0, [SP, #2]
ADDW	R2, R0, #20
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
SUB	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,77 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main7:
SUBS	R7, R7, #1
BNE	L_main7
NOP
NOP
;Snake_Game.c,81 :: 		}
L_main6:
;Snake_Game.c,83 :: 		if(Dir == 2)
LDRB	R0, [SP, #5]
CMP	R0, #2
IT	NE
BNE	L_main9
;Snake_Game.c,86 :: 		HeadXPos = HeadXPos-16;
LDRSH	R0, [SP, #0]
SUBS	R0, #16
STRH	R0, [SP, #0]
;Snake_Game.c,87 :: 		Draw(HeadXPos,HeadYPos);
LDRSH	R1, [SP, #2]
BL	_Draw+0
;Snake_Game.c,88 :: 		Clear(HeadXPos+(NumberOfDots*16),HeadYPos);
LDRB	R0, [SP, #4]
LSLS	R1, R0, #4
SXTH	R1, R1
LDRSH	R0, [SP, #0]
ADDS	R0, R0, R1
LDRSH	R1, [SP, #2]
BL	_Clear+0
;Snake_Game.c,90 :: 		Clear(HeadXPos+12,HeadYPos+(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
ADDS	R1, R0, R1
LDRSH	R0, [SP, #0]
ADDS	R0, #12
BL	_Clear+0
;Snake_Game.c,91 :: 		Clear(HeadXPos+12,HeadYPos-(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
SUB	R1, R0, R1
LDRSH	R0, [SP, #0]
ADDS	R0, #12
BL	_Clear+0
;Snake_Game.c,92 :: 		Clear(HeadXPos+20,HeadYPos+(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
ADDS	R1, R0, R1
LDRSH	R0, [SP, #0]
ADDS	R0, #20
BL	_Clear+0
;Snake_Game.c,93 :: 		Clear(HeadXPos+20,HeadYPos-(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
SUB	R1, R0, R1
LDRSH	R0, [SP, #0]
ADDS	R0, #20
BL	_Clear+0
;Snake_Game.c,95 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main10:
SUBS	R7, R7, #1
BNE	L_main10
NOP
NOP
;Snake_Game.c,99 :: 		}
L_main9:
;Snake_Game.c,101 :: 		if(Dir == 3)
LDRB	R0, [SP, #5]
CMP	R0, #3
IT	NE
BNE	L_main12
;Snake_Game.c,104 :: 		HeadYPos = HeadYPos+16;
LDRSH	R0, [SP, #2]
ADDS	R0, #16
STRH	R0, [SP, #2]
;Snake_Game.c,105 :: 		Draw(HeadXPos,HeadYPos);
SXTH	R1, R0
LDRSH	R0, [SP, #0]
BL	_Draw+0
;Snake_Game.c,106 :: 		Clear(HeadXPos,HeadYPos-(NumberOfDots*16));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #4
SXTH	R1, R1
LDRSH	R0, [SP, #2]
SUB	R0, R0, R1
SXTH	R1, R0
LDRSH	R0, [SP, #0]
BL	_Clear+0
;Snake_Game.c,108 :: 		Clear(HeadXPos+((NumberOfDots)*8),HeadYPos-12);
LDRSH	R0, [SP, #2]
SUBW	R2, R0, #12
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
ADDS	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,109 :: 		Clear(HeadXPos-((NumberOfDots)*8),HeadYPos-12);
LDRSH	R0, [SP, #2]
SUBW	R2, R0, #12
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
SUB	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,110 :: 		Clear(HeadXPos+((NumberOfDots)*8),HeadYPos-20);
LDRSH	R0, [SP, #2]
SUBW	R2, R0, #20
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
ADDS	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,111 :: 		Clear(HeadXPos-((NumberOfDots)*8),HeadYPos-20);
LDRSH	R0, [SP, #2]
SUBW	R2, R0, #20
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #0]
SUB	R0, R0, R1
SXTH	R1, R2
BL	_Clear+0
;Snake_Game.c,113 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main13:
SUBS	R7, R7, #1
BNE	L_main13
NOP
NOP
;Snake_Game.c,116 :: 		}
L_main12:
;Snake_Game.c,118 :: 		if(Dir == 4)
LDRB	R0, [SP, #5]
CMP	R0, #4
IT	NE
BNE	L_main15
;Snake_Game.c,122 :: 		HeadXPos = HeadXPos+16 ;
LDRSH	R0, [SP, #0]
ADDS	R0, #16
STRH	R0, [SP, #0]
;Snake_Game.c,123 :: 		Draw(HeadXPos,HeadYPos);
LDRSH	R1, [SP, #2]
BL	_Draw+0
;Snake_Game.c,124 :: 		Clear(HeadXPos-(NumberOfDots*16),HeadYPos);
LDRB	R0, [SP, #4]
LSLS	R1, R0, #4
SXTH	R1, R1
LDRSH	R0, [SP, #0]
SUB	R0, R0, R1
LDRSH	R1, [SP, #2]
BL	_Clear+0
;Snake_Game.c,126 :: 		Clear(HeadXPos-12,HeadYPos+(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
ADDS	R1, R0, R1
LDRSH	R0, [SP, #0]
SUBS	R0, #12
BL	_Clear+0
;Snake_Game.c,127 :: 		Clear(HeadXPos-12,HeadYPos-(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
SUB	R1, R0, R1
LDRSH	R0, [SP, #0]
SUBS	R0, #12
BL	_Clear+0
;Snake_Game.c,128 :: 		Clear(HeadXPos-20,HeadYPos+(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
ADDS	R1, R0, R1
LDRSH	R0, [SP, #0]
SUBS	R0, #20
BL	_Clear+0
;Snake_Game.c,129 :: 		Clear(HeadXPos-20,HeadYPos-(NumberOfDots*8));
LDRB	R0, [SP, #4]
LSLS	R1, R0, #3
SXTH	R1, R1
LDRSH	R0, [SP, #2]
SUB	R1, R0, R1
LDRSH	R0, [SP, #0]
SUBS	R0, #20
BL	_Clear+0
;Snake_Game.c,131 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_main16:
SUBS	R7, R7, #1
BNE	L_main16
NOP
NOP
;Snake_Game.c,134 :: 		}
L_main15:
;Snake_Game.c,138 :: 		}
IT	AL
BAL	L_main0
;Snake_Game.c,140 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_Draw:
;Snake_Game.c,144 :: 		void Draw(s16 x,s16 y)
; y start address is: 4 (R1)
; x start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R3, R0
SXTH	R4, R1
; y end address is: 4 (R1)
; x end address is: 0 (R0)
; x start address is: 12 (R3)
; y start address is: 16 (R4)
;Snake_Game.c,146 :: 		TFT_Set_Pen(CL_BLACK,15);
MOVS	R1, #15
MOVW	R0, #0
BL	_TFT_Set_Pen+0
;Snake_Game.c,147 :: 		TFT_Circle(x,y,2);
MOVS	R2, #2
SXTH	R2, R2
SXTH	R1, R4
; y end address is: 16 (R4)
SXTH	R0, R3
; x end address is: 12 (R3)
BL	_TFT_Circle+0
;Snake_Game.c,148 :: 		}
L_end_Draw:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Draw
_Clear:
;Snake_Game.c,150 :: 		void Clear(s16 x,s16 y)
; y start address is: 4 (R1)
; x start address is: 0 (R0)
SUB	SP, SP, #4
STR	LR, [SP, #0]
SXTH	R3, R0
SXTH	R4, R1
; y end address is: 4 (R1)
; x end address is: 0 (R0)
; x start address is: 12 (R3)
; y start address is: 16 (R4)
;Snake_Game.c,152 :: 		TFT_Set_Pen(CL_WHITE,15);
MOVS	R1, #15
MOVW	R0, #65535
BL	_TFT_Set_Pen+0
;Snake_Game.c,153 :: 		TFT_Circle(x,y,2);
MOVS	R2, #2
SXTH	R2, R2
SXTH	R1, R4
; y end address is: 16 (R4)
SXTH	R0, R3
; x end address is: 12 (R3)
BL	_TFT_Circle+0
;Snake_Game.c,154 :: 		}
L_end_Clear:
LDR	LR, [SP, #0]
ADD	SP, SP, #4
BX	LR
; end of _Clear
