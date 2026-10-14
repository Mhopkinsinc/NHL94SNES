; Unidentified routine.
CODE_9FF220:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF35F
	sta.b a1
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF372
	sta.b a1
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF385
	sta.b a1
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF394
	sta.b a1
	jsl.l CODE_9FF329
	bra CODE_9FF2CC
