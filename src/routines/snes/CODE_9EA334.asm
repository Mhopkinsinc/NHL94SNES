; Unidentified routine.
CODE_9EA334:
	lda.b $A5
	sta.w $1163,y
	ldy.b $91
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
	sta.w $14E3,x
	jsl.l CODE_9EA3F1
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	tya
	sta.w $0F03,x
	lda.w #$F3A6
	sta.w $14E3,x
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
	ldy.b $91
	sty.w $1E8D
	lda.w $19D4,y
	sta.w $1E93
	lda.w #$0024
	sta.b $A5
	jsl.l AddPenalty
	bra CODE_9EA3CE
