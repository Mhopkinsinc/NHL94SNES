; Unidentified routine.
CODE_9FEAB4:
	lda.w #$2400
	sta.w $0D0D
	lda.b d0
	cmp.w $0D15
	bne CODE_9FEAC7
	lda.w #$2000
	sta.w $0D0D
CODE_9FEAC7:
	lda.w #$0006
	sta.w printx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF902
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	ldy.w #$001E
CODE_9FEAF4:
	lda.b [a0],y
	sta.b [a1],y
	dey
	dey
	bpl CODE_9FEAF4
	jsl.l CODE_9FEB32
	jsl.l CODE_9FEBA6
	jsl.l CODE_9FEBEB
	lda.b [a1]
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0011
	sta.w printx
	jsl.l print
	inc.w printy
	lda.b a0
	clc
	adc.b [a0]
	sta.b a0
	inc.b d0
	lda.b d0
	sec
	sbc.w $0D13
	cmp.w #$0005
	bne CODE_9FEAB4
	rtl
