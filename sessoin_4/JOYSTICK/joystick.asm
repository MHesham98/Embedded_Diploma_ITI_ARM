_main:
;joystick.c,9 :: 		void main()
SUB	SP, SP, #8
;joystick.c,10 :: 		{    int i=0;
MOVW	R0, #0
STRH	R0, [SP, #0]
MOVW	R0, #0
STRH	R0, [SP, #2]
MOVS	R0, #100
STRB	R0, [SP, #4]
;joystick.c,12 :: 		int j=0;
;joystick.c,14 :: 		char port='d';
;joystick.c,16 :: 		int tempb=0;
;joystick.c,17 :: 		int tempc=0;
;joystick.c,18 :: 		int tempd=0;
;joystick.c,20 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;joystick.c,21 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;joystick.c,22 :: 		GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_GPIO_Digital_Output+0
;joystick.c,25 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_4);
MOVW	R1, #16
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick.c,26 :: 		GPIO_Digital_Input(&GPIOD_IDR,_GPIO_PINMASK_2);
MOVW	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick.c,27 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_5);
MOVW	R1, #32
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick.c,28 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_6);
MOVW	R1, #64
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;joystick.c,30 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,31 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,32 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,33 :: 		while(1)
L_main0:
;joystick.c,39 :: 		if(Button(&GPIOD_IDR,PINUP,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main2
;joystick.c,40 :: 		{  ++i;
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [SP, #0]
;joystick.c,41 :: 		if(i==4)
CMP	R0, #4
IT	NE
BNE	L_main3
;joystick.c,46 :: 		tempd = GPIOD_ODR;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
; tempd start address is: 8 (R2)
LDR	R2, [R0, #0]
;joystick.c,47 :: 		tempc = GPIOC_ODR;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
; tempc start address is: 12 (R3)
LDR	R3, [R0, #0]
;joystick.c,48 :: 		tempb = GPIOB_ODR;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
; tempb start address is: 16 (R4)
LDR	R4, [R0, #0]
;joystick.c,50 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,51 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,52 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,54 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main4:
SUBS	R7, R7, #1
BNE	L_main4
NOP
NOP
NOP
NOP
;joystick.c,56 :: 		GPIOD_ODR = tempd;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R2, [R0, #0]
; tempd end address is: 8 (R2)
;joystick.c,57 :: 		GPIOC_ODR = tempc;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R3, [R0, #0]
; tempc end address is: 12 (R3)
;joystick.c,58 :: 		GPIOB_ODR = tempb;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R4, [R0, #0]
; tempb end address is: 16 (R4)
;joystick.c,63 :: 		i=3;
MOVS	R0, #3
SXTH	R0, R0
STRH	R0, [SP, #0]
;joystick.c,65 :: 		}
IT	AL
BAL	L_main6
L_main3:
;joystick.c,70 :: 		GPIOD_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,71 :: 		GPIOC_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,72 :: 		GPIOB_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,73 :: 		}
L_main6:
;joystick.c,75 :: 		while(Button(&GPIOD_IDR,PINUP,DELAY,ACTIVE_STATE)==255)
L_main7:
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #4
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main8
;joystick.c,78 :: 		}
IT	AL
BAL	L_main7
L_main8:
;joystick.c,81 :: 		}
IT	AL
BAL	L_main9
L_main2:
;joystick.c,84 :: 		else if(Button(&GPIOB_IDR,PINDOWN,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main10
;joystick.c,86 :: 		--i;
LDRSH	R0, [SP, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [SP, #0]
;joystick.c,88 :: 		if(i==-1)
CMP	R0, #-1
IT	NE
BNE	L_main11
;joystick.c,91 :: 		tempd = GPIOD_ODR;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
; tempd start address is: 8 (R2)
LDR	R2, [R0, #0]
;joystick.c,92 :: 		tempc = GPIOC_ODR;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
; tempc start address is: 12 (R3)
LDR	R3, [R0, #0]
;joystick.c,93 :: 		tempb = GPIOB_ODR;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
; tempb start address is: 16 (R4)
LDR	R4, [R0, #0]
;joystick.c,95 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,96 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,97 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,99 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main12:
SUBS	R7, R7, #1
BNE	L_main12
NOP
NOP
NOP
NOP
;joystick.c,101 :: 		GPIOD_ODR = tempd;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R2, [R0, #0]
; tempd end address is: 8 (R2)
;joystick.c,102 :: 		GPIOC_ODR = tempc;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R3, [R0, #0]
; tempc end address is: 12 (R3)
;joystick.c,103 :: 		GPIOB_ODR = tempb;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R4, [R0, #0]
; tempb end address is: 16 (R4)
;joystick.c,106 :: 		i=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #0]
;joystick.c,107 :: 		}
IT	AL
BAL	L_main14
L_main11:
;joystick.c,110 :: 		GPIOD_ODR >>=1 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,111 :: 		GPIOC_ODR >>=1 ;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,112 :: 		GPIOB_ODR >>=1 ;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,113 :: 		}
L_main14:
;joystick.c,114 :: 		while(Button(&GPIOB_IDR,PINDOWN,DELAY,ACTIVE_STATE)==255)
L_main15:
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main16
;joystick.c,117 :: 		}
IT	AL
BAL	L_main15
L_main16:
;joystick.c,122 :: 		}
IT	AL
BAL	L_main17
L_main10:
;joystick.c,124 :: 		else if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main18
;joystick.c,127 :: 		--j;
LDRSH	R0, [SP, #2]
SUBS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,129 :: 		if(j==-1 && port == 'b')
CMP	R0, #-1
IT	NE
BNE	L__main60
LDRB	R0, [SP, #4]
CMP	R0, #98
IT	NE
BNE	L__main59
L__main58:
;joystick.c,131 :: 		GPIOC_ODR = (GPIOB_ODR<<12);
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #12
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,132 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,133 :: 		j=3 ;
MOVS	R0, #3
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,134 :: 		port = 'c';
MOVS	R0, #99
STRB	R0, [SP, #4]
;joystick.c,135 :: 		}
IT	AL
BAL	L_main22
;joystick.c,129 :: 		if(j==-1 && port == 'b')
L__main60:
L__main59:
;joystick.c,137 :: 		else if(j==-1 && port == 'c')
LDRSH	R0, [SP, #2]
CMP	R0, #-1
IT	NE
BNE	L__main62
LDRB	R0, [SP, #4]
CMP	R0, #99
IT	NE
BNE	L__main61
L__main57:
;joystick.c,140 :: 		GPIOD_ODR = (GPIOC_ODR<<12);
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #12
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,141 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,142 :: 		j=3 ;
MOVS	R0, #3
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,143 :: 		port = 'd';
MOVS	R0, #100
STRB	R0, [SP, #4]
;joystick.c,145 :: 		}
IT	AL
BAL	L_main26
;joystick.c,137 :: 		else if(j==-1 && port == 'c')
L__main62:
L__main61:
;joystick.c,147 :: 		else if(j==-1 && port =='d')
LDRSH	R0, [SP, #2]
CMP	R0, #-1
IT	NE
BNE	L__main64
LDRB	R0, [SP, #4]
CMP	R0, #100
IT	NE
BNE	L__main63
L__main56:
;joystick.c,149 :: 		tempd = GPIOD_ODR;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
; tempd start address is: 8 (R2)
LDR	R2, [R0, #0]
;joystick.c,150 :: 		tempc = GPIOC_ODR;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
; tempc start address is: 12 (R3)
LDR	R3, [R0, #0]
;joystick.c,151 :: 		tempb = GPIOB_ODR;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
; tempb start address is: 16 (R4)
LDR	R4, [R0, #0]
;joystick.c,153 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,154 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,155 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,157 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main30:
SUBS	R7, R7, #1
BNE	L_main30
NOP
NOP
NOP
NOP
;joystick.c,159 :: 		GPIOD_ODR = tempd;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R2, [R0, #0]
; tempd end address is: 8 (R2)
;joystick.c,160 :: 		GPIOC_ODR = tempc;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R3, [R0, #0]
; tempc end address is: 12 (R3)
;joystick.c,161 :: 		GPIOB_ODR = tempb;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R4, [R0, #0]
; tempb end address is: 16 (R4)
;joystick.c,164 :: 		j=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,166 :: 		}
IT	AL
BAL	L_main32
;joystick.c,147 :: 		else if(j==-1 && port =='d')
L__main64:
L__main63:
;joystick.c,170 :: 		GPIOD_ODR >>=4 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #4
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,171 :: 		GPIOC_ODR >>=4 ;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,172 :: 		GPIOB_ODR >>=4 ;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #4
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,174 :: 		}
L_main32:
L_main26:
L_main22:
;joystick.c,175 :: 		while(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
L_main33:
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #6
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main34
;joystick.c,178 :: 		}
IT	AL
BAL	L_main33
L_main34:
;joystick.c,181 :: 		}
IT	AL
BAL	L_main35
L_main18:
;joystick.c,183 :: 		else if(Button(&GPIOD_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main36
;joystick.c,184 :: 		{  ++j;
LDRSH	R0, [SP, #2]
ADDS	R0, R0, #1
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,185 :: 		if(j==4 && port == 'd')
CMP	R0, #4
IT	NE
BNE	L__main66
LDRB	R0, [SP, #4]
CMP	R0, #100
IT	NE
BNE	L__main65
L__main55:
;joystick.c,187 :: 		GPIOC_ODR = (GPIOD_ODR>>12);
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #12
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,188 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,189 :: 		j=0 ;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,190 :: 		port = 'c';
MOVS	R0, #99
STRB	R0, [SP, #4]
;joystick.c,191 :: 		}
IT	AL
BAL	L_main40
;joystick.c,185 :: 		if(j==4 && port == 'd')
L__main66:
L__main65:
;joystick.c,193 :: 		else if(j==4 && port == 'c')
LDRSH	R0, [SP, #2]
CMP	R0, #4
IT	NE
BNE	L__main68
LDRB	R0, [SP, #4]
CMP	R0, #99
IT	NE
BNE	L__main67
L__main54:
;joystick.c,195 :: 		GPIOB_ODR = (GPIOC_ODR>>12);
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #12
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,196 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,197 :: 		j=0 ;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,198 :: 		port = 'b';
MOVS	R0, #98
STRB	R0, [SP, #4]
;joystick.c,199 :: 		}
IT	AL
BAL	L_main44
;joystick.c,193 :: 		else if(j==4 && port == 'c')
L__main68:
L__main67:
;joystick.c,202 :: 		else if(j==4&& port == 'b')
LDRSH	R0, [SP, #2]
CMP	R0, #4
IT	NE
BNE	L__main70
LDRB	R0, [SP, #4]
CMP	R0, #98
IT	NE
BNE	L__main69
L__main53:
;joystick.c,204 :: 		tempd = GPIOD_ODR;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
; tempd start address is: 8 (R2)
LDR	R2, [R0, #0]
;joystick.c,205 :: 		tempc = GPIOC_ODR;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
; tempc start address is: 12 (R3)
LDR	R3, [R0, #0]
;joystick.c,206 :: 		tempb = GPIOB_ODR;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
; tempb start address is: 16 (R4)
LDR	R4, [R0, #0]
;joystick.c,208 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,209 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,210 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,212 :: 		Delay_ms(100);
MOVW	R7, #9043
MOVT	R7, #8
NOP
NOP
L_main48:
SUBS	R7, R7, #1
BNE	L_main48
NOP
NOP
NOP
NOP
;joystick.c,214 :: 		GPIOD_ODR = tempd;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R2, [R0, #0]
; tempd end address is: 8 (R2)
;joystick.c,215 :: 		GPIOC_ODR = tempc;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R3, [R0, #0]
; tempc end address is: 12 (R3)
;joystick.c,216 :: 		GPIOB_ODR = tempb;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R4, [R0, #0]
; tempb end address is: 16 (R4)
;joystick.c,218 :: 		j=3 ;
MOVS	R0, #3
SXTH	R0, R0
STRH	R0, [SP, #2]
;joystick.c,219 :: 		}
IT	AL
BAL	L_main50
;joystick.c,202 :: 		else if(j==4&& port == 'b')
L__main70:
L__main69:
;joystick.c,223 :: 		GPIOD_ODR <<=4 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #4
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;joystick.c,224 :: 		GPIOC_ODR <<=4 ;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #4
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;joystick.c,225 :: 		GPIOB_ODR <<=4 ;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #4
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;joystick.c,228 :: 		}
L_main50:
L_main44:
L_main40:
;joystick.c,230 :: 		while(Button(&GPIOD_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
L_main51:
MOVS	R3, #0
MOVS	R2, #30
MOVS	R1, #2
MOVW	R0, #lo_addr(GPIOD_IDR+0)
MOVT	R0, #hi_addr(GPIOD_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main52
;joystick.c,233 :: 		}
IT	AL
BAL	L_main51
L_main52:
;joystick.c,236 :: 		}
L_main36:
L_main35:
L_main17:
L_main9:
;joystick.c,239 :: 		}
IT	AL
BAL	L_main0
;joystick.c,241 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
