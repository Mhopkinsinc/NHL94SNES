; Unidentified routine.
CODE_9BA31C:
	lda.l $7E3420,x
	sec
	sbc.w $0ADB
	bpl CODE_9BA342
	clc
	adc.l DATA8_9BA414,x
	sta.l $7E3420,x
	lda.l $7E340C,x
	inc a
	cmp.w #$0004
	bne CODE_9BA33C
	lda.w #$0001
CODE_9BA33C:
	sta.l $7E340C,x
	bra CODE_9BA346
