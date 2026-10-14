; Unidentified routine.
CODE_9FF25A:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3A0
	sta.b a1
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3B6
	sta.b a1
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3CC
	sta.b a1
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3E0
	sta.b a1
	jsl.l CODE_9FF329
	bra CODE_9FF2CC
