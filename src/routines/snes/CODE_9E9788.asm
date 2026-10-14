; Unidentified routine.
CODE_9E9788:
	lda.w $0DF9
	sec
	sbc.w #$0010
	bpl CODE_9E97DC
	ldy.w $15BF
.loop:
	sty.b d1
	cpy.w #$000F
	beq .t1
	lda.w $15C4,y
	and.w #$00FF
	tay
	lda.w Ylist,y
	sec
	sbc.w pucky
	sec
	sbc.w #$0028
	bpl .t1
	jsl.l CODE_9E97DD
	ldy.b d1
	iny
	bra .loop

.t1:
	ldy.w $15BF
	beq CODE_9E97DC
.loopx:
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
	bne .loopx
CODE_9E97DC:
	rtl
