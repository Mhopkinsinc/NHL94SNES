; Unidentified routine.
CODE_9FBE08:
	lda.b a2
	pha
	phx
	lda.w printx
	asl a
	asl a
	asl a
	clc
	adc.w #$0024
	tax
	lda.l $7E3464
	beq CODE_9FBE23
	txa
	sec
	sbc.w #$0008
	tax
CODE_9FBE23:
	lda.w printy
	asl a
	asl a
	asl a
	inc a
	inc a
	inc a
	tay
	lda.l $7E346A
	bne CODE_9FBE3B
	lda.l $7E3464
	bne CODE_9FBE3B
	bra CODE_9FBE43
