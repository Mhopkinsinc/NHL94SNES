; Unidentified routine.
CODE_9EA65A:
	jsl.l vtoa
CODE_9EA65E:
	lda.b a0
	sta.w $1D5A
	lda.b $8A
	sta.w $1D5B
	jsl.l $001D59
	lda.b d0
	sta.w temp2b,x
	cmp.w #$0008
	bcc CODE_9EA694
	lda.w Xvel,x
	ora.w Yvel,x
	bne CODE_9EA694
	lda.w puckx
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	jsl.l vtoa
CODE_9EA694:
	lda.w temp2b,x
	sta.b d0
	jml.l doplayeracc
