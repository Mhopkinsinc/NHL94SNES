; Unidentified routine.
CODE_9EC894:
	phx
	lda.w #$0020
	sta.b $24
	lda.b [$8D]
	dec a
	dec a
	sta.b $22
	inc.b $8D
	inc.b $8D
	lda.b $8F
	sta.b $0E
	lda.b $8D
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldy.w printy
	ldx.w printx
	lda.l $7E35B6
	clc
	adc.l $7E35A8
	ora.w printa
	jsl.l CODE_9EC8CE
	plx
	rtl
