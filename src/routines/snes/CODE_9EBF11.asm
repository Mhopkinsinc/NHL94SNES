; Unidentified routine.
CODE_9EBF11:
	lda.w $1E9B
	ora.w $163A
	ora.w $1D81
	bne .rtl
	phx
	stz.w PBnum
	ldx.w #$0000
.loop:
	lda.w position,x
	bpl .1
	jsl.l CODE_9EBEA1
	lda.b $08
	sta.w Ypos,x
	lda.w #$0088
	sta.w Xpos,x
	jsl.l CODE_9EBEDF
.1:
	inx
	inx
	cpx.w #$0018
	bcc .loop
	plx
.rtl:
	rtl
