; Unidentified routine.
CODE_80A831:
	tay
	rep #$20
	lda.b $5E
	jsr.w MulFrac16
CODE_80A839:
	lda.b $5A
	sec
	sbc.b $43
	sta.b $5A
CODE_80A840:
	rep #$20
	ldy.b #$02
	lda.b ($4E),y
	ldx.w $0800
	clc
	adc.b $5A
	sta.w $094A,x
	lda.b $4A
	and.w #$00FF
	cmp.w #$0010
	bne CODE_80A867
	lda.w sflags
	bit.w #$0800
	bne CODE_80A867
	lda.w $094A,x
	sta.w $0CAF
CODE_80A867:
	sep #$20
	jsr.w CODE_80A465
	tya
	plp
	rts
