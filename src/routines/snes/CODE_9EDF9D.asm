; Unidentified routine.
CODE_9EDF9D:
	lda.w $1543,y
	beq CODE_9EDFA9
	stz.b $B1
	lda.w #$0001
	sta.b $B5
CODE_9EDFA9:
	iny
	iny
	dec.b $B1
	bpl CODE_9EDF84
CODE_9EDFAF:
	lda.b $B5
	jsl.l CODE_9BB370
	cmp.w #$0009
	bcs CODE_9EDFF6
	lda.w pucky
	sta.b $A5
	lda.w pfgoal,x
	bne CODE_9EDFCC
	lda.w #$0000
	sec
	sbc.b $A5
	sta.b $A5
CODE_9EDFCC:
	lda.b $A5
	bmi CODE_9EDFF6
	lda.w #$0108
	sec
	sbc.b $A5
	bmi CODE_9EDFF6
	lda.w $163A
	beq CODE_9EDFEB
	lda.w #$00B0
	lsr a
	lsr a
	clc
	adc.w #$0058
	sec
	sbc.b $A5
	bpl CODE_9EDFF6
CODE_9EDFEB:
	lda.w sflags
	bit.w #$8000
	bne CODE_9EDFF6
	jmp.w CODE_9EE10B
