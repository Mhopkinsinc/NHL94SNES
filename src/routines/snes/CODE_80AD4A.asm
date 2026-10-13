; Unidentified routine.
CODE_80AD4A:
	inc.w $09FA,x
CODE_80AD4D:
	lda.w $098A,x
	clc
	adc.b $60
	sta.b $60
CODE_80AD55:
	ply
	cpy.b #$02
	bne CODE_80AD64
	sep #$20
	ldy.b $4B
	jsr.w CODE_80A4FD
CODE_80AD61:
	jmp.w CODE_80AD90
