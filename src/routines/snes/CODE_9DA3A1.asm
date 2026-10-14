; Unidentified routine.
CODE_9DA3A1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF515
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF532
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9FBF75
	jsl.l CODE_9B8682
CODE_9DA3DD:
	jsl.l CODE_9B8017
	ldx.w #$0008
CODE_9DA3E4:
	lda.w $1A0E
	bne CODE_9DA3F6
	lda.w JoyPad,x
	bit.w #$000F
	bne CODE_9DA3F6
	and.w #$FFF0
	bne CODE_9DA3FC
CODE_9DA3F6:
	dex
	dex
	bpl CODE_9DA3E4
	bra CODE_9DA3DD
