; Unidentified routine.
CODE_9EB198:
	stz.b d1
	lda.w pucky
	sec
	sbc.w #$0058
	bpl .1
	inc.b d1
	inc.b d1
	lda.w pucky
	sec
	sbc.w #$FFA8
	bpl .rtl
.1:
	lda.w gmode
	bit.w #$0002
	beq .2
	lda.b d1
	eor.w #$0002
	sta.b d1
.2:
	ldy.b d1
	lda.w $1752,y
	inc a
	sta.w $1752,y
.rtl:
	rtl
