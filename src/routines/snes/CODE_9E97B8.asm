; Unidentified routine.
CODE_9E97B8:
	ldy.w $15BF
	beq CODE_9E97DC
CODE_9E97BD:
	sty.b d1
	lda.w $15C2,y
	and.w #$00FF
	tay
	lda.w pucky
	sec
	sbc.w Ylist,y
	sec
	sbc.w #$0028
	bpl CODE_9E97DC
	jsl.l CODE_9E97DD
	ldy.b d1
	dey
	bne CODE_9E97BD
CODE_9E97DC:
	rtl
