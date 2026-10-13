; Unidentified routine.
CODE_80B18D:
	stx.w OAMHiShift
CODE_80B190:
	lda.w OAMNext
	clc
	adc.w #$0004
	sta.w OAMNext
	tax
CODE_80B19B:
	ldy.w $07D0
	dec.b $00
	beq CODE_80B1A5
	jmp.w CODE_80B0DD
