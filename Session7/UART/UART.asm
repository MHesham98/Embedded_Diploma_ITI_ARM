_main:
;UART.c,4 :: 		void main()
;UART.c,6 :: 		UART1_Init(115200);
MOV	R0, #115200
BL	_UART1_Init+0
;UART.c,7 :: 		Delay_ms(100);
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
;UART.c,9 :: 		UART1_Write_Text("Hello!");
MOVW	R0, #lo_addr(?lstr1_UART+0)
MOVT	R0, #hi_addr(?lstr1_UART+0)
BL	_UART1_Write_Text+0
;UART.c,10 :: 		UART1_Write(13);
MOVS	R0, #13
BL	_UART1_Write+0
;UART.c,11 :: 		UART1_Write(10);
MOVS	R0, #10
BL	_UART1_Write+0
;UART.c,14 :: 		while(1)
L_main2:
;UART.c,16 :: 		if(UART_Data_Ready())
BL	_UART_Data_Ready+0
CMP	R0, #0
IT	EQ
BEQ	L_main4
;UART.c,18 :: 		read = UART1_Read();
BL	_UART1_Read+0
;UART.c,19 :: 		UART1_Write(read);
UXTB	R0, R0
BL	_UART1_Write+0
;UART.c,20 :: 		}
L_main4:
;UART.c,22 :: 		}
IT	AL
BAL	L_main2
;UART.c,24 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
