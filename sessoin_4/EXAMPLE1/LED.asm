_main:
;LED.c,6 :: 		void main()
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
;LED.c,11 :: 		GPIOD_ODR=0x00;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LED.c,13 :: 		while(1)
L_main0:
;LED.c,17 :: 		if(Button(&GPIOA_IDR,PIN,DELAY,ACTIVE_STATE)==255)
MOVS	R3, #1
MOVS	R2, #30
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOA_IDR+0)
MOVT	R0, #hi_addr(GPIOA_IDR+0)
BL	_Button+0
CMP	R0, #255
IT	NE
BNE	L_main2
;LED.c,19 :: 		GPIOD_ODR ^= 0XFF;
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
EOR	R1, R0, #255
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;LED.c,21 :: 		while(Button(&GPIOA_IDR,PIN,DELAY,ACTIVE_STATE)==255)
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
;LED.c,24 :: 		}
IT	AL
BAL	L_main3
L_main4:
;LED.c,25 :: 		}
L_main2:
;LED.c,30 :: 		}
IT	AL
BAL	L_main0
;LED.c,32 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
