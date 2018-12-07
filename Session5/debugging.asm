_Toggle:
;debugging.c,3 :: 		void Toggle(int *ptr)
; ptr start address is: 0 (R0)
MOV	R1, R0
; ptr end address is: 0 (R0)
; ptr start address is: 4 (R1)
;debugging.c,5 :: 		for(i=0;i<5;++i)
; i start address is: 0 (R0)
MOVS	R0, #0
SXTH	R0, R0
; ptr end address is: 4 (R1)
; i end address is: 0 (R0)
SXTH	R2, R0
MOV	R0, R1
L_Toggle0:
; i start address is: 8 (R2)
; ptr start address is: 0 (R0)
; ptr start address is: 0 (R0)
; ptr end address is: 0 (R0)
CMP	R2, #5
IT	GE
BGE	L_Toggle1
; ptr end address is: 0 (R0)
;debugging.c,7 :: 		*ptr = 0x00;
; ptr start address is: 0 (R0)
MOVS	R1, #0
SXTH	R1, R1
STRH	R1, [R0, #0]
;debugging.c,8 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Toggle3:
SUBS	R7, R7, #1
BNE	L_Toggle3
NOP
NOP
;debugging.c,9 :: 		*ptr = 0xff;
MOVS	R1, #255
SXTH	R1, R1
STRH	R1, [R0, #0]
;debugging.c,10 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_Toggle5:
SUBS	R7, R7, #1
BNE	L_Toggle5
NOP
NOP
;debugging.c,5 :: 		for(i=0;i<5;++i)
ADDS	R2, R2, #1
SXTH	R2, R2
;debugging.c,11 :: 		}
; ptr end address is: 0 (R0)
; i end address is: 8 (R2)
IT	AL
BAL	L_Toggle0
L_Toggle1:
;debugging.c,12 :: 		}
L_end_Toggle:
BX	LR
; end of _Toggle
_TogglePin:
;debugging.c,17 :: 		void TogglePin(int *ptr,u8 PIN)
; PIN start address is: 4 (R1)
; ptr start address is: 0 (R0)
; PIN end address is: 4 (R1)
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
; PIN start address is: 4 (R1)
;debugging.c,19 :: 		*ptr &= ~(1<<PIN);
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R1
SXTH	R2, R2
MVN	R3, R2
SXTH	R3, R3
LDRSH	R2, [R0, #0]
ANDS	R2, R3
STRH	R2, [R0, #0]
;debugging.c,20 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_TogglePin7:
SUBS	R7, R7, #1
BNE	L_TogglePin7
NOP
NOP
;debugging.c,21 :: 		*ptr |= (1<<PIN);
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
; PIN end address is: 4 (R1)
LDRSH	R2, [R0, #0]
ORRS	R2, R3
STRH	R2, [R0, #0]
; ptr end address is: 0 (R0)
;debugging.c,22 :: 		Delay_ms(500);
MOVW	R7, #45225
MOVT	R7, #40
NOP
NOP
L_TogglePin9:
SUBS	R7, R7, #1
BNE	L_TogglePin9
NOP
NOP
;debugging.c,24 :: 		}
L_end_TogglePin:
BX	LR
; end of _TogglePin
_SetBit:
;debugging.c,27 :: 		void SetBit(int *ptr,u8 PIN)
; PIN start address is: 4 (R1)
; ptr start address is: 0 (R0)
; PIN end address is: 4 (R1)
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
; PIN start address is: 4 (R1)
;debugging.c,31 :: 		*ptr |= (1<<PIN);
MOVS	R2, #1
SXTH	R2, R2
LSL	R3, R2, R1
SXTH	R3, R3
; PIN end address is: 4 (R1)
LDRSH	R2, [R0, #0]
ORRS	R2, R3
STRH	R2, [R0, #0]
; ptr end address is: 0 (R0)
;debugging.c,34 :: 		}
L_end_SetBit:
BX	LR
; end of _SetBit
_ClearBit:
;debugging.c,36 :: 		void ClearBit(int *ptr,u8 PIN)
; PIN start address is: 4 (R1)
; ptr start address is: 0 (R0)
; PIN end address is: 4 (R1)
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
; PIN start address is: 4 (R1)
;debugging.c,40 :: 		*ptr &= ~(1<<PIN);
MOVS	R2, #1
SXTH	R2, R2
LSLS	R2, R1
SXTH	R2, R2
; PIN end address is: 4 (R1)
MVN	R3, R2
SXTH	R3, R3
LDRSH	R2, [R0, #0]
ANDS	R2, R3
STRH	R2, [R0, #0]
; ptr end address is: 0 (R0)
;debugging.c,43 :: 		}
L_end_ClearBit:
BX	LR
; end of _ClearBit
_SetPort:
;debugging.c,45 :: 		void SetPort(int *ptr)
; ptr start address is: 0 (R0)
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
;debugging.c,49 :: 		*ptr |= 0xFFFF;
LDRSH	R2, [R0, #0]
MOVW	R1, #65535
ORR	R1, R2, R1, LSL #0
STRH	R1, [R0, #0]
; ptr end address is: 0 (R0)
;debugging.c,52 :: 		}
L_end_SetPort:
BX	LR
; end of _SetPort
_ClearPort:
;debugging.c,54 :: 		void ClearPort(int *ptr)
; ptr start address is: 0 (R0)
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
;debugging.c,58 :: 		*ptr &= 0xFFFF;
LDRSH	R2, [R0, #0]
MOVW	R1, #65535
AND	R1, R2, R1, LSL #0
STRH	R1, [R0, #0]
; ptr end address is: 0 (R0)
;debugging.c,61 :: 		}
L_end_ClearPort:
BX	LR
; end of _ClearPort
_SetValue:
;debugging.c,63 :: 		void SetValue(s16 *ptr,u8 Value)
; Value start address is: 4 (R1)
; ptr start address is: 0 (R0)
; Value end address is: 4 (R1)
; ptr end address is: 0 (R0)
; ptr start address is: 0 (R0)
; Value start address is: 4 (R1)
;debugging.c,65 :: 		if(Value == 0)
CMP	R1, #0
IT	NE
BNE	L_SetValue11
; Value end address is: 4 (R1)
;debugging.c,67 :: 		*ptr = 0;
MOVS	R2, #0
SXTH	R2, R2
STRH	R2, [R0, #0]
; ptr end address is: 0 (R0)
;debugging.c,68 :: 		}
IT	AL
BAL	L_SetValue12
L_SetValue11:
;debugging.c,72 :: 		*ptr=0xffff;
; ptr start address is: 0 (R0)
MOVW	R2, #65535
SXTH	R2, R2
STRH	R2, [R0, #0]
; ptr end address is: 0 (R0)
;debugging.c,75 :: 		}
L_SetValue12:
;debugging.c,79 :: 		}
L_end_SetValue:
BX	LR
; end of _SetValue
