; Unidentified routine.
CODE_9FA5EA:
	phx
	lda.b d0
	pha
CODE_9FA5EE:
	ldx.w #$0000
CODE_9FA5F1:
	txa
	asl a
	tay
	lda.w $1C84,y
	beq CODE_9FA602
	txa
	jsl.l CODE_9B84DC
	lda.b d3
	bne CODE_9FA623
CODE_9FA602:
	inx
	cpx.w #$0005
	bcc CODE_9FA5F1
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	lda.b $83
CODE_9FA616:
	cmp.b $83
	beq CODE_9FA616
	jsl.l CODE_9B8017
	pla
	dec a
	pha
	bpl CODE_9FA5EE
CODE_9FA623:
	pla
	plx
	rtl
