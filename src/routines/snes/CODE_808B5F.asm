; Unidentified routine.
CODE_808B5F:
	lda.w #$0020
	sbc.b $1C
	asl a
	sta.b $20
	sta.w DAS1L
	stx.w A1T1L
	sty.w VMADDL
	sep #$20
	lda.b #$02
	sta.w MDMAEN
	rep #$20
	lda.b $18
	asl a
	sec
	sbc.b $20
	sta.w DAS1L
	txa
	clc
	adc.b $20
	sta.w A1T1L
	tya
	adc.w #$0400
	and.w #$FFE0
	sta.w VMADDL
	jmp.w CODE_808B35
