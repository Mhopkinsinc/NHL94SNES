; Unidentified routine.
CODE_80B36F:
	stx.w OAMHiShift
CODE_80B372:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
CODE_80B37D:
	ldy.w $07D0
	dec.b $00
	beq CODE_80B387
	jmp.w CODE_80B286
