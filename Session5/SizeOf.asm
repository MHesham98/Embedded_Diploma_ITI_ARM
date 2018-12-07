_main:
;SizeOf.c,6 :: 		void main() {
SUB	SP, SP, #4
;SizeOf.c,11 :: 		u8 HEIGHT=1;
;SizeOf.c,13 :: 		char arr[7] = {sizeof(char),sizeof(int),sizeof(short int),sizeof(long int),sizeof(float),sizeof(double),sizeof(long double)} ;
;SizeOf.c,20 :: 		GPIO_Digital_Output(&GPIOD_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
BL	_GPIO_Digital_Output+0
;SizeOf.c,23 :: 		GPIO_Digital_Output(&GPIOB_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOB_ODR+0)
MOVT	R0, #hi_addr(GPIOB_ODR+0)
BL	_GPIO_Digital_Output+0
;SizeOf.c,24 :: 		GPIO_Digital_Output(&GPIOC_ODR,_GPIO_PINMASK_ALL);
MOVW	R1, #65535
MOVW	R0, #lo_addr(GPIOC_ODR+0)
MOVT	R0, #hi_addr(GPIOC_ODR+0)
BL	_GPIO_Digital_Output+0
;SizeOf.c,26 :: 		ADC_Set_Input_Channel(_ADC_CHANNEL_3);
MOVW	R0, #8
BL	_ADC_Set_Input_Channel+0
;SizeOf.c,28 :: 		ADC1_Init();
BL	_ADC1_Init+0
;SizeOf.c,31 :: 		GPIO_Digital_Output(&GPIOE_ODR,_GPIO_PINMASK_14);
MOVW	R1, #16384
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
BL	_GPIO_Digital_Output+0
;SizeOf.c,32 :: 		GPIOE_ODR =0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOE_ODR+0)
MOVT	R0, #hi_addr(GPIOE_ODR+0)
STR	R1, [R0, #0]
;SizeOf.c,34 :: 		GPIOD_ODR =0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;SizeOf.c,37 :: 		while(1)
L_main0:
;SizeOf.c,41 :: 		GPIOD_ODR =0;
MOVS	R1, #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;SizeOf.c,42 :: 		adcValue = ADC1_Get_Sample(3);
MOVS	R0, #3
BL	_ADC1_Get_Sample+0
;SizeOf.c,43 :: 		BuzzerFrequency=2000+(adcValue*2000/4096.0);
MOVW	R1, #2000
MULS	R1, R0, R1
UXTH	R1, R1
VMOV	S1, R1
VCVT.F32	#0, S1, S1
MOV	R1, #1166016512
VMOV	S0, R1
VDIV.F32	S1, S1, S0
MOVW	R1, #0
MOVT	R1, #17658
VMOV	S0, R1
VADD.F32	S0, S0, S1
VCVT	#1, .F32, S0, S0
VMOV	R2, S0
UXTH	R2, R2
;SizeOf.c,46 :: 		COUNT = adcValue/1023;
MOVW	R1, #1023
UDIV	R0, R0, R1
STRB	R0, [SP, #0]
;SizeOf.c,47 :: 		BuzzerOn(BuzzerFrequency,0.5);
VMOV.F32	S0, #0.5
UXTH	R0, R2
BL	_BuzzerOn+0
;SizeOf.c,48 :: 		for(i=0;i<COUNT;i++)
MOVS	R0, #0
STRB	R0, [SP, #1]
L_main2:
LDRB	R1, [SP, #0]
LDRB	R0, [SP, #1]
CMP	R0, R1
IT	CS
BCS	L_main3
;SizeOf.c,51 :: 		GPIOD_ODR |= (1<<4*i)<<COUNT-1;
LDRB	R0, [SP, #1]
LSLS	R1, R0, #2
SXTH	R1, R1
MOVS	R0, #1
SXTH	R0, R0
LSL	R1, R0, R1
SXTH	R1, R1
LDRB	R0, [SP, #0]
SUBS	R0, R0, #1
SXTH	R0, R0
LSLS	R1, R0
SXTH	R1, R1
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
LDR	R0, [R0, #0]
ORR	R1, R0, R1, LSL #0
MOVW	R0, #lo_addr(GPIOD_ODR+0)
MOVT	R0, #hi_addr(GPIOD_ODR+0)
STR	R1, [R0, #0]
;SizeOf.c,48 :: 		for(i=0;i<COUNT;i++)
LDRB	R0, [SP, #1]
ADDS	R0, R0, #1
STRB	R0, [SP, #1]
;SizeOf.c,53 :: 		}
IT	AL
BAL	L_main2
L_main3:
;SizeOf.c,84 :: 		}
IT	AL
BAL	L_main0
;SizeOf.c,87 :: 		}
L_end_main:
L__main_end_loop:
B	L__main_end_loop
; end of _main
_VarSize:
;SizeOf.c,90 :: 		void VarSize(char SIZE)
; SIZE start address is: 0 (R0)
; SIZE end address is: 0 (R0)
; SIZE start address is: 0 (R0)
;SizeOf.c,92 :: 		char i=0;
;SizeOf.c,93 :: 		GPIOD_ODR=0;
MOVS	R2, #0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;SizeOf.c,94 :: 		for(i=0;i<SIZE;i++)
; i start address is: 12 (R3)
MOVS	R3, #0
; SIZE end address is: 0 (R0)
; i end address is: 12 (R3)
L_VarSize5:
; i start address is: 12 (R3)
; SIZE start address is: 0 (R0)
CMP	R3, R0
IT	CS
BCS	L_VarSize6
;SizeOf.c,96 :: 		GPIOD_ODR |= (1<<i);
MOVS	R1, #1
SXTH	R1, R1
LSL	R2, R1, R3
SXTH	R2, R2
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, R2, LSL #0
MOVW	R1, #lo_addr(GPIOD_ODR+0)
MOVT	R1, #hi_addr(GPIOD_ODR+0)
STR	R2, [R1, #0]
;SizeOf.c,94 :: 		for(i=0;i<SIZE;i++)
ADDS	R3, R3, #1
UXTB	R3, R3
;SizeOf.c,97 :: 		}
; SIZE end address is: 0 (R0)
; i end address is: 12 (R3)
IT	AL
BAL	L_VarSize5
L_VarSize6:
;SizeOf.c,98 :: 		}
L_end_VarSize:
BX	LR
; end of _VarSize
_BuzzerOn:
;SizeOf.c,102 :: 		void BuzzerOn(u32 frequency,f32 DutyCycle)
; DutyCycle start address is: 0 (R0)
; frequency start address is: 0 (R0)
VMOV.F32	S2, S0
; DutyCycle end address is: 0 (R0)
; frequency end address is: 0 (R0)
; frequency start address is: 0 (R0)
; DutyCycle start address is: 8 (R2)
;SizeOf.c,110 :: 		PeriodicTime = 1000.0/frequency;
VMOV	S1, R0
VCVT.F32	#0, S1, S1
; frequency end address is: 0 (R0)
MOVW	R1, #0
MOVT	R1, #17530
VMOV	S0, R1
VDIV.F32	S1, S0, S1
;SizeOf.c,111 :: 		T_ON = PeriodicTime * DutyCycle;
VMUL.F32	S0, S1, S2
; DutyCycle end address is: 8 (R2)
; T_ON start address is: 12 (R3)
VMOV.F32	S3, S0
;SizeOf.c,112 :: 		T_OFF = PeriodicTime - T_ON;
VSUB.F32	S2, S1, S0
; T_OFF start address is: 8 (R2)
;SizeOf.c,118 :: 		GPIOE_ODR |= (1<<14);
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R1, [R1, #0]
ORR	R2, R1, #16384
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;SizeOf.c,119 :: 		for(i=0;i<T_ON*1000;++i)
; i start address is: 0 (R0)
MOVS	R0, #0
; T_ON end address is: 12 (R3)
; T_OFF end address is: 8 (R2)
; i end address is: 0 (R0)
L_BuzzerOn8:
; i start address is: 0 (R0)
; T_OFF start address is: 8 (R2)
; T_ON start address is: 12 (R3)
MOVW	R1, #0
MOVT	R1, #17530
VMOV	S0, R1
VMUL.F32	S1, S3, S0
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_BuzzerOn9
;SizeOf.c,121 :: 		Delay_us(1);
MOVW	R7, #3
MOVT	R7, #0
NOP
NOP
L_BuzzerOn11:
SUBS	R7, R7, #1
BNE	L_BuzzerOn11
NOP
NOP
NOP
NOP
;SizeOf.c,119 :: 		for(i=0;i<T_ON*1000;++i)
ADDS	R0, R0, #1
UXTH	R0, R0
;SizeOf.c,122 :: 		}
; T_ON end address is: 12 (R3)
; i end address is: 0 (R0)
IT	AL
BAL	L_BuzzerOn8
L_BuzzerOn9:
;SizeOf.c,124 :: 		GPIOE_ODR &= ~(1<<14);
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
LDR	R2, [R1, #0]
MVN	R1, #16384
ANDS	R2, R1
MOVW	R1, #lo_addr(GPIOE_ODR+0)
MOVT	R1, #hi_addr(GPIOE_ODR+0)
STR	R2, [R1, #0]
;SizeOf.c,125 :: 		for(i=0;i<T_OFF*1000;i++)
; i start address is: 0 (R0)
MOVS	R0, #0
; T_OFF end address is: 8 (R2)
; i end address is: 0 (R0)
L_BuzzerOn13:
; i start address is: 0 (R0)
; T_OFF start address is: 8 (R2)
MOVW	R1, #0
MOVT	R1, #17530
VMOV	S0, R1
VMUL.F32	S1, S2, S0
VMOV	S0, R0
VCVT.F32	#0, S0, S0
VCMPE.F32	S0, S1
VMRS	#60, FPSCR
IT	GE
BGE	L_BuzzerOn14
;SizeOf.c,127 :: 		Delay_us(1);
MOVW	R7, #3
MOVT	R7, #0
NOP
NOP
L_BuzzerOn16:
SUBS	R7, R7, #1
BNE	L_BuzzerOn16
NOP
NOP
NOP
NOP
;SizeOf.c,125 :: 		for(i=0;i<T_OFF*1000;i++)
ADDS	R0, R0, #1
UXTH	R0, R0
;SizeOf.c,128 :: 		}
; T_OFF end address is: 8 (R2)
; i end address is: 0 (R0)
IT	AL
BAL	L_BuzzerOn13
L_BuzzerOn14:
;SizeOf.c,136 :: 		return;
;SizeOf.c,137 :: 		}
L_end_BuzzerOn:
BX	LR
; end of _BuzzerOn
