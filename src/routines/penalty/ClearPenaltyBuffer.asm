; Unidentified routine.
ClearPenaltyBuffer:
	lda.w #$001F
	sta.b $A5
	lda.w #$0000
	sta.b $8B
	lda.w #$15DE
	sta.b $89
CODE_9EC116:
	lda.w #$0000
	sta.b [$89]
	inc.b $89
	inc.b $89
	dec.b $A5
	bpl CODE_9EC116
	rtl
