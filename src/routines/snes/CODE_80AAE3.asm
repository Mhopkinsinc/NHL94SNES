; Unidentified routine.
CODE_80AAE3:
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
CODE_80AAEB:
	lda.w $095A,x
	sec
	sbc.b $43
	sta.b $5A
CODE_80AAF3:
	ldy.b #$02
	lda.b ($4E),y
	clc
	adc.b $5A
	sta.w $094A,x
	ply
CODE_80AAFE:
	sep #$20
	dey
	bmi CODE_80AB06
	jmp.w CODE_80AA71
