; Unidentified routine.
CODE_80B26C:
	stx.w OAMHiShift
CODE_80B26F:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
CODE_80B27A:
	ldy.w $07D0
	dec.b $00
	beq CODE_80B284
	jmp.w CODE_80B1A7
