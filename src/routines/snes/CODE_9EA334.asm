; Unidentified routine.
CODE_9EA334:
	lda.b $A5
	sta.w facedir,y
	ldy.b $91
	lda.w Xvel,x
	clc
	adc.w Xvel,y
	pha
	asl a
	pla
	ror a
	sta.w Xvel,x
	sta.w Xvel,y
	lda.w Yvel,x
	clc
	adc.w Yvel,y
	pha
	asl a
	pla
	ror a
	sta.w Yvel,x
	sta.w Yvel,y
	tya
	sta.w $0F03,x
	lda.w #DATA8_9DF46A
	sta.w pfalock,x
	jsl.l CODE_9EA3F1
	ldx.b $91
	ldy.b $95
	sty.b $91
	stx.b $95
	tya
	sta.w $0F03,x
	lda.w #DATA8_9DF3A6
	sta.w pfalock,x
	ldy.w SPA,x
	cpy.w #DATA8_9DF374
	beq CODE_9EA388
	lda.w #DATA8_9DF3D8
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
