; Turn the password bits into the password characters
BitstoPW:
	ldx.w #$000F
.char:
	lda.w #PWrange
	sta.b d0
	jsl.l SuperDiv
	sep #$20
	lda.b d0
	sta.l PassWord,x
	rep #$30
	dex
	bpl .char
	rtl
