_main:
;LED.c,6 :: 		void main()
;LED.c,7 :: 		{    int i=0;
; i start address is: 44 (R11)
MOVW	R11, #0
SXTH	R11, R11
;LED.c,8 :: 		GPIO_Digital_Input(&GPIOA_IDR,_GPIO_PINMASK_0);
MOVW	R1, #1
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_GPIO_Digital_Input+0
;LED.c,9 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;LED.c,11 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
; i end address is: 44 (R11)
SXTH	R6, R11
;LED.c,13 :: 		while(1)
L_main0:
;LED.c,17 :: 		if(Button(&GPIOA_IDR,PIN,DELAY,ACTIVE_STATE)==255)
; i start address is: 24 (R6)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L__main7
;LED.c,20 :: 		GPIOD_ODR <<=1 ;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
LSLS	R1, R0, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LED.c,21 :: 		++i;
ADDS	R0, R6, #1
; i end address is: 24 (R6)
; i start address is: 4 (R1)
SXTH	R1, R0
; i end address is: 4 (R1)
SXTH	R6, R1
;LED.c,22 :: 		while(Button(&GPIOA_IDR,PIN,DELAY,ACTIVE_STATE)==255)
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
;LED.c,25 :: 		}
IT	AL
BAL	L_main3
L_main4:
;LED.c,27 :: 		if(i==16)
CMP	R6, #16
IT	NE
BNE	L__main6
; i end address is: 24 (R6)
;LED.c,29 :: 		GPIOD_ODR=1;
MOVS	R1, #1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LED.c,30 :: 		i=0;
; i start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; i end address is: 0 (R0)
;LED.c,31 :: 		}
IT	AL
BAL	L_main5
L__main6:
;LED.c,27 :: 		if(i==16)
SXTH	R0, R6
;LED.c,31 :: 		}
L_main5:
;LED.c,34 :: 		}
; i start address is: 0 (R0)
SXTH	R6, R0
; i end address is: 0 (R0)
IT	AL
BAL	L_main2
L__main7:
;LED.c,17 :: 		if(Button(&GPIOA_IDR,PIN,DELAY,ACTIVE_STATE)==255)
;LED.c,34 :: 		}
L_main2:
;LED.c,39 :: 		}
; i start address is: 24 (R6)
; i end address is: 24 (R6)
IT	AL
BAL	L_main0
;LED.c,41 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
