; Unidentified routine.
CODE_9FEBD9:
	lda.w #$009F
	sta.b $9B
	lda.w #DATA8_9FEC30
	sta.b a4
CODE_9FEBE3:
	ldy.w #$0001
	jsl.l CODE_9FEB90
	rtl
