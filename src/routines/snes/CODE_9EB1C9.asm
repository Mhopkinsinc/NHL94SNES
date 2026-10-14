; Unidentified routine.
CODE_9EB1C9:
	stz.b d1
	lda.w tmap
	sec
	sbc.w $17A8
	beq .rtl
	bpl .1
	lda.w #$0002
	sta.b d1
.1:
	ldy.b d1
	lda.w $1756,y
	inc a
	sta.w $1756,y
.rtl:
	rtl
