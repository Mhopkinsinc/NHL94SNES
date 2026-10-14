; Unidentified routine.
CODE_9EA334:
	lda.b d0
	sta.w facedir,y
	ldy.b a2
	lda.w $0EC3,x
	clc
	adc.w $0EC3,y
	pha
	asl a
	pla
	ror a
	sta.w $0EC3,x
	sta.w $0EC3,y
	lda.w $0EE3,x
	clc
	adc.w $0EE3,y
	pha
	asl a
	pla
	ror a
	sta.w $0EE3,x
	sta.w $0EE3,y
	tya
	sta.w $0F03,x
	lda.w #$F46A
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
	ldx.b a2
	ldy.b a3
	sty.b a2
	stx.b a3
	tya
	sta.w $0F03,x
	lda.w #$F3A6
	sta.w pfalock,x
	ldy.w SPA,x
	cpy.w #$F374
	beq CODE_9EA388
	lda.w #$F3D8
CODE_9EA388:
	jsl.l CODE_9EA3F1
	jsl.l CODE_9EC042
	beq CODE_9EA3AD
	lda.w $1E8D
	bpl CODE_9EA3AD
	ldy.b a2
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b d0
	jsl.l AddPenalty
	bra CODE_9EA3CE
