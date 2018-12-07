_main:
;DAC.c,2 :: 		void main()
;DAC.c,6 :: 		GPIO_Digital_Output(&GPIOA_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOA_ODR+0)
MOVT	R0, #hi_addr(GPIOA_ODR+0)
BL	_GPIO_Digital_Output+0
;DAC.c,7 :: 		DAC1_Init( _DAC_CH1_ENABLE);
MOVS	R0, #1
BL	_DAC1_Init+0
;DAC.c,8 :: 		i=0;
; i start address is: 0 (R0)
MOVS	R0, #0
; i end address is: 0 (R0)
UXTH	R6, R0
;DAC.c,10 :: 		while(1)
L_main0:
;DAC.c,12 :: 		if(i==4096)
; i start address is: 24 (R6)
CMP	R6, #4096
IT	NE
BNE	L__main5
;DAC.c,14 :: 		i=0;
MOVS	R6, #0
; i end address is: 24 (R6)
;DAC.c,15 :: 		}
IT	AL
BAL	L_main2
L__main5:
;DAC.c,12 :: 		if(i==4096)
;DAC.c,15 :: 		}
L_main2:
;DAC.c,17 :: 		DAC1_Ch1_Output(i);
; i start address is: 24 (R6)
UXTH	R0, R6
BL	_DAC1_Ch1_Output+0
;DAC.c,18 :: 		Delay_ms(1);
MOVW	R7, #5331
MOVT	R7, #0
NOP
NOP
L_main3:
SUBS	R7, R7, #1
BNE	L_main3
NOP
NOP
NOP
NOP
;DAC.c,19 :: 		i++;
ADDS	R6, R6, #1
UXTH	R6, R6
;DAC.c,23 :: 		}
; i end address is: 24 (R6)
IT	AL
BAL	L_main0
;DAC.c,25 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
