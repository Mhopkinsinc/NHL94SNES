; Unidentified routine.
CODE_9FF294:
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF3EE
	sta.b a1
	jsl.l CODE_9FF2D5
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF404
	sta.b a1
	jsl.l CODE_9FF2F1
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF41A
	sta.b a1
	jsl.l CODE_9FF30D
	lda.w #$009F
	sta.b $8F
	lda.w #DATA8_9FF42E
	sta.b a1
	jsl.l CODE_9FF329
CODE_9FF2CC:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	rtl
