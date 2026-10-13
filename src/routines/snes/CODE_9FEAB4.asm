; Unidentified routine.
CODE_9FEAB4:
	lda.w #$2400
	sta.w $0D0D
	lda.b $A5
	cmp.w $0D15
	bne CODE_9FEAC7
	lda.w #$2000
	sta.w $0D0D
CODE_9FEAC7:
	lda.w #$0006
	sta.w printx
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF902
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	ldy.w #$001E
CODE_9FEAF4:
	lda.b [$89],y
	sta.b [$8D],y
	dey
	dey
	bpl CODE_9FEAF4
	jsl.l CODE_9FEB32
	jsl.l CODE_9FEBA6
	jsl.l CODE_9FEBEB
	lda.b [$8D]
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0011
	sta.w printx
	jsl.l CODE_9EC7BE
	inc.w printy
	lda.b $89
	clc
	adc.b [$89]
	sta.b $89
	inc.b $A5
	lda.b $A5
	sec
	sbc.w $0D13
	cmp.w #$0005
	bne CODE_9FEAB4
	rtl
