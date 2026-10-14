; Unidentified routine.
CODE_9E9788:
	lda.w $0DF9
	sec
	sbc.w #$0010
	bpl CODE_9E97DC
	ldy.w $15BF
CODE_9E9794:
	sty.b d1
	cpy.w #$000F
	beq CODE_9E97B8
	lda.w $15C4,y
	and.w #$00FF
	tay
	lda.w Ylist,y
	sec
	sbc.w pucky
	sec
	sbc.w #$0028
	bpl CODE_9E97B8
	jsl.l CODE_9E97DD
	ldy.b d1
	iny
	bra CODE_9E9794
