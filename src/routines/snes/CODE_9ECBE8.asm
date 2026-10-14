; Unidentified routine.
CODE_9ECBE8:
	phx
	lda.b a0
	pha
	jsl.l GetPlayerRecord
	lda.b $8B
	sta.b $8F
	lda.b a0
	sta.b a1
	lda.w #$0000
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	pla
	sta.b a0
	plx
	stx.b d0
	jmp.w CODE_9ECD36
