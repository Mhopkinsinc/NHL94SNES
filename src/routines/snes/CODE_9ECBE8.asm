; Unidentified routine.
CODE_9ECBE8:
	phx
	lda.b $89
	pha
	jsl.l GetPlayerRecord
	lda.b $8B
	sta.b $8F
	lda.b $89
	sta.b $8D
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	pla
	sta.b $89
	plx
	stx.b $A5
	jmp.w CODE_9ECD36
