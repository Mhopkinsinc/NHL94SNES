; Unidentified routine.
CODE_9ECC25:
	lda.w tmdata
	sta.b $8D
CODE_9ECC2A:
	lda.w #$009C
	sta.b $8F
	ldy.w #$0004
	lda.b $8D
	clc
	adc.b [$8D],y
	sta.b $8D
	lda.b $A5
	pha
	lda.w #$0002
	sta.b $A5
	jsl.l AdvanceStringPtr
	pla
	sta.b $A5
	jmp.w $CD19
