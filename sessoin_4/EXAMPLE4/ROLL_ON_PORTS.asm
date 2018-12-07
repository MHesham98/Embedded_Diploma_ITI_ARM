_main:
;ROLL_ON_PORTS.c,7 :: 		void main()
SUB	SP, SP, #4
;ROLL_ON_PORTS.c,8 :: 		{    int i=0;
MOVW	R0, #0
STRH	R0, [SP, #0]
MOVS	R0, #100
STRB	R0, [SP, #2]
;ROLL_ON_PORTS.c,9 :: 		char port = 'd';
;ROLL_ON_PORTS.c,11 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;ROLL_ON_PORTS.c,12 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;ROLL_ON_PORTS.c,13 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;ROLL_ON_PORTS.c,14 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;ROLL_ON_PORTS.c,15 :: 		GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_GPIO_Digital_Output+0
;ROLL_ON_PORTS.c,17 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,18 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,19 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,20 :: 		while(1)
L_main0:
;ROLL_ON_PORTS.c,24 :: 		if(Button(&GPIOA_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main2
;ROLL_ON_PORTS.c,26 :: 		GPIOD_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,27 :: 		GPIOC_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,28 :: 		GPIOB_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,29 :: 		++i;
LDRSH	R0, [SP, #0]
ADDS	R0, R0, #1
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,30 :: 		while(Button(&GPIOA_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
L_main3:
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main4
;ROLL_ON_PORTS.c,33 :: 		}
IT	AL
BAL	L_main3
L_main4:
;ROLL_ON_PORTS.c,35 :: 		if(i==16&&port == 'd')
LDRSH	R0, [SP, #0]
CMP	R0, #16
IT	NE
BNE	L__main34
LDRB	R0, [SP, #2]
CMP	R0, #100
IT	NE
BNE	L__main33
L__main32:
;ROLL_ON_PORTS.c,37 :: 		GPIOC_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,38 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,39 :: 		port = 'c';
MOVS	R0, #99
STRB	R0, [SP, #2]
;ROLL_ON_PORTS.c,40 :: 		i=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,35 :: 		if(i==16&&port == 'd')
L__main34:
L__main33:
;ROLL_ON_PORTS.c,44 :: 		if(i==14&&port == 'c')
LDRSH	R0, [SP, #0]
CMP	R0, #14
IT	NE
BNE	L__main36
LDRB	R0, [SP, #2]
CMP	R0, #99
IT	NE
BNE	L__main35
L__main31:
;ROLL_ON_PORTS.c,46 :: 		GPIOB_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,47 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,48 :: 		port = 'b';
MOVS	R0, #98
STRB	R0, [SP, #2]
;ROLL_ON_PORTS.c,49 :: 		i=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,44 :: 		if(i==14&&port == 'c')
L__main36:
L__main35:
;ROLL_ON_PORTS.c,53 :: 		if(i==13&&port == 'b')
LDRSH	R0, [SP, #0]
CMP	R0, #13
IT	NE
BNE	L__main38
LDRB	R0, [SP, #2]
CMP	R0, #98
IT	NE
BNE	L__main37
L__main30:
;ROLL_ON_PORTS.c,55 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,56 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,57 :: 		port = 'd';
MOVS	R0, #100
STRB	R0, [SP, #2]
;ROLL_ON_PORTS.c,58 :: 		i=0;
MOVS	R0, #0
SXTH	R0, R0
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,53 :: 		if(i==13&&port == 'b')
L__main38:
L__main37:
;ROLL_ON_PORTS.c,64 :: 		}
IT	AL
BAL	L_main14
L_main2:
;ROLL_ON_PORTS.c,67 :: 		else if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main15
;ROLL_ON_PORTS.c,69 :: 		GPIOD_ODR >>=1 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,70 :: 		GPIOC_ODR >>=1 ;
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,71 :: 		GPIOB_ODR >>=1 ;
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,72 :: 		--i;
LDRSH	R0, [SP, #0]
SUBS	R0, R0, #1
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,73 :: 		while(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
L_main16:
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main17
;ROLL_ON_PORTS.c,76 :: 		}
IT	AL
BAL	L_main16
L_main17:
;ROLL_ON_PORTS.c,78 :: 		if(i==-1&& port == 'd')
LDRSH	R0, [SP, #0]
CMP	R0, #-1
IT	NE
BNE	L__main40
LDRB	R0, [SP, #2]
CMP	R0, #100
IT	NE
BNE	L__main39
L__main29:
;ROLL_ON_PORTS.c,80 :: 		GPIOD_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,81 :: 		GPIOB_ODR=0b0001000000000000;
MOVW	R1, #4096
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,82 :: 		port = 'b';
MOVS	R0, #98
STRB	R0, [SP, #2]
;ROLL_ON_PORTS.c,83 :: 		i=12;
MOVS	R0, #12
SXTH	R0, R0
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,78 :: 		if(i==-1&& port == 'd')
L__main40:
L__main39:
;ROLL_ON_PORTS.c,86 :: 		if(i==-1&& port == 'c')
LDRSH	R0, [SP, #0]
CMP	R0, #-1
IT	NE
BNE	L__main42
LDRB	R0, [SP, #2]
CMP	R0, #99
IT	NE
BNE	L__main41
L__main28:
;ROLL_ON_PORTS.c,88 :: 		GPIOC_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,89 :: 		GPIOD_ODR=0b1000000000000000;
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,90 :: 		port = 'd';
MOVS	R0, #100
STRB	R0, [SP, #2]
;ROLL_ON_PORTS.c,91 :: 		i=15;
MOVS	R0, #15
SXTH	R0, R0
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,86 :: 		if(i==-1&& port == 'c')
L__main42:
L__main41:
;ROLL_ON_PORTS.c,95 :: 		if(i==-1&& port == 'b')
LDRSH	R0, [SP, #0]
CMP	R0, #-1
IT	NE
BNE	L__main44
LDRB	R0, [SP, #2]
CMP	R0, #98
IT	NE
BNE	L__main43
L__main27:
;ROLL_ON_PORTS.c,97 :: 		GPIOB_ODR=0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,98 :: 		GPIOC_ODR=0b0010000000000000;
MOVW	R1, #8192
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
STR	R1, [R0, #0]
;ROLL_ON_PORTS.c,99 :: 		port = 'c';
MOVS	R0, #99
STRB	R0, [SP, #2]
;ROLL_ON_PORTS.c,100 :: 		i=13;
MOVS	R0, #13
SXTH	R0, R0
STRH	R0, [SP, #0]
;ROLL_ON_PORTS.c,95 :: 		if(i==-1&& port == 'b')
L__main44:
L__main43:
;ROLL_ON_PORTS.c,106 :: 		}
L_main15:
L_main14:
;ROLL_ON_PORTS.c,113 :: 		}
IT	AL
BAL	L_main0
;ROLL_ON_PORTS.c,115 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
