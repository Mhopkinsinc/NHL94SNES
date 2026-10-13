; Unidentified routine.
CODE_9ED050:
	lda.w $0BCB,x
	bne CODE_9ED07A
	lda.b $A5
	sec
	sbc.w $1163,x
	sta.b $A5
	beq CODE_9ED07A
	eor.w #$FFFF
	inc a
	and.w #$0004
	lsr a
	dec a
	clc
	adc.w $1163,x
	and.w #$0007
	sta.b $A5
	sta.w $1163,x
	lda.w #$0006
	sta.w $0BCB,x
CODE_9ED07A:
	lda.w $0BCB,x
	beq CODE_9ED08B
	sec
	sbc.w $0ADB
	bpl CODE_9ED088
	lda.w #$0000
CODE_9ED088:
	sta.w $0BCB,x
CODE_9ED08B:
	lda.w $0B05,x
	bit.w #$0002
	bne CODE_9ED098
	lda.w #$E0FE
	bra CODE_9ED09B
