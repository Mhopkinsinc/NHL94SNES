; Unidentified routine.
CODE_9EC894:
	phx
	lda.w #$0020
	sta.b $24
	lda.b [a1]
	dec a
	dec a
	sta.b $22
	inc.b a1
	inc.b a1
	lda.b $8F
	sta.b $0E
	lda.b a1
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldy.w printy
	ldx.w printx
	lda.l $7E35B6
	clc
	adc.l printfontset
	ora.w $0D0D
	jsl.l CODE_9EC8CE
	plx
	rtl
