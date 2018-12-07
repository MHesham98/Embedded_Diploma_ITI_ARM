_main:
;Double_Bounce.c,7 :: 		void main()
;Double_Bounce.c,8 :: 		{    int i=0;
; i start address is: 44 (R11)
MOVW	R11, #0
SXTH	R11, R11
;Double_Bounce.c,9 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;Double_Bounce.c,10 :: 		GPIO_Digital_Input(&GPIOB_IDR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_IDR+0)
MOVT	R0, #hi_addr(GPIOB_IDR+0)
BL	_GPIO_Digital_Input+0
;Double_Bounce.c,11 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;Double_Bounce.c,13 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
; i end address is: 44 (R11)
SXTH	R6, R11
;Double_Bounce.c,15 :: 		while(1)
L_main0:
;Double_Bounce.c,19 :: 		if(Button(&GPIOA_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
; i start address is: 24 (R6)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main2
;Double_Bounce.c,22 :: 		GPIOD_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Double_Bounce.c,23 :: 		++i;
ADDS	R1, R6, #1
SXTH	R1, R1
; i end address is: 24 (R6)
; i start address is: 4 (R1)
; i end address is: 4 (R1)
SXTH	R6, R1
;Double_Bounce.c,24 :: 		while(Button(&GPIOA_IDR,PINLEFT,DELAY,ACTIVE_STATE)==255)
L_main3:
; i start address is: 24 (R6)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main4
;Double_Bounce.c,27 :: 		}
IT	AL
BAL	L_main3
L_main4:
;Double_Bounce.c,29 :: 		if(i==16)
CMP	R6, #16
IT	NE
BNE	L__main11
; i end address is: 24 (R6)
;Double_Bounce.c,31 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Double_Bounce.c,32 :: 		i=0;
; i start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; i end address is: 0 (R0)
;Double_Bounce.c,33 :: 		}
IT	AL
BAL	L_main5
L__main11:
;Double_Bounce.c,29 :: 		if(i==16)
SXTH	R0, R6
;Double_Bounce.c,33 :: 		}
L_main5:
;Double_Bounce.c,34 :: 		}
; i start address is: 0 (R0)
SXTH	R6, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_main6
L_main2:
;Double_Bounce.c,37 :: 		else if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
; i start address is: 24 (R6)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L__main13
;Double_Bounce.c,39 :: 		GPIOD_ODR >>=1 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSRS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Double_Bounce.c,40 :: 		--i;
SUBS	R0, R6, #1
; i end address is: 24 (R6)
; i start address is: 4 (R1)
SXTH	R1, R0
; i end address is: 4 (R1)
SXTH	R6, R1
;Double_Bounce.c,41 :: 		while(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
L_main8:
; i start address is: 24 (R6)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #5
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main9
;Double_Bounce.c,44 :: 		}
IT	AL
BAL	L_main8
L_main9:
;Double_Bounce.c,46 :: 		if(i==-1)
CMP	R6, #-1
IT	NE
BNE	L__main12
; i end address is: 24 (R6)
;Double_Bounce.c,48 :: 		GPIOD_ODR=0b1000000000000000;
MOVW	R1, #32768
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;Double_Bounce.c,49 :: 		i=15;
; i start address is: 0 (R0)
MOVS	R0, #15
SXTH	R0, R0
; i end address is: 0 (R0)
;Double_Bounce.c,50 :: 		}
IT	AL
BAL	L_main10
L__main12:
;Double_Bounce.c,46 :: 		if(i==-1)
SXTH	R0, R6
;Double_Bounce.c,50 :: 		}
L_main10:
;Double_Bounce.c,55 :: 		}
; i start address is: 0 (R0)
; i end address is: 0 (R0)
IT	AL
BAL	L_main7
L__main13:
;Double_Bounce.c,37 :: 		else if(Button(&GPIOA_IDR,PINRIGHT,DELAY,ACTIVE_STATE)==255)
SXTH	R0, R6
;Double_Bounce.c,55 :: 		}
L_main7:
; i start address is: 0 (R0)
SXTH	R6, R0
; i end address is: 0 (R0)
L_main6:
;Double_Bounce.c,62 :: 		}
; i start address is: 24 (R6)
; i end address is: 24 (R6)
IT	AL
BAL	L_main0
;Double_Bounce.c,64 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
