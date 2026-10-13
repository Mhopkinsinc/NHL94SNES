; Unidentified routine.
CODE_9EBF11:
	lda.w $1E9B
	ora.w $163A
	ora.w $1D81
	bne CODE_9EBF43
	phx
	stz.w PBnum
	ldx.w #$0000
CODE_9EBF23:
	lda.w position,x
	bpl CODE_9EBF3B
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	jsl.l CODE_9EBEDF
CODE_9EBF3B:
	inx
	inx
	cpx.w #$0018
	bcc CODE_9EBF23
	plx
CODE_9EBF43:
	rtl
