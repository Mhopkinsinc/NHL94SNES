; Unidentified routine.
CODE_9BC10F:
	lda.w sfhormode
	beq CODE_9BC128
	lda.b $A5
	pha
	lda.b $A9
	eor.w #$FFFF
	inc a
	sta.b $A5
	pla
	sec
	sbc.w #$00C5
	sta.b $A9
	bra CODE_9BC138
