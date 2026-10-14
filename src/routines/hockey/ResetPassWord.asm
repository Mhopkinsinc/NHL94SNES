; Blank the password
ResetPassWord:
	sep #$30
	lda.b #$00
	sta.l PassWord
	ldx.b #$0F
	lda.b #$1E
.loop:
	sta.l PassWord,x
	dex
	bne .loop
	rep #$30
	rtl
