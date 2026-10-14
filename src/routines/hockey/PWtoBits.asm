; Turn the password characters into the password bits
PWtoBits:
	jsl.l CODE_9BCD8F
	ldx.w #$0000
.char:
	lda.w #PWrange
	sta.b d0
	jsl.l CODE_9CA4CF
	lda.l PassWord,x
	and.w #$00FF
	sta.b d0
	stz.b d0+2
	jsl.l SuperAdd
	inx
	cpx.w #pwlength
	bne .char
	rtl
