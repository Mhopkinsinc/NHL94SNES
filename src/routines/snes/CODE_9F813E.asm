; Unidentified routine.
CODE_9F813E:
	lda.w printx
	sta.b $B5
	lda.w #$2400
	sta.w $0D0D
	lda.w #$000C
	sta.w printy
	inc.w printx
	cpx.w #$0004
	bne CODE_9F8179
	dec.w printx
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7C2
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	inc.w printy
	bra CODE_9F8197
