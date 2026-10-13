; Unidentified routine.
CODE_9B9F91:
	lda.l $7E35E0
	cmp.w #$0480
	bcc CODE_9B9F9D
	lda.w #$0480
CODE_9B9F9D:
	sec
	sbc.w $0CDD
	sta.l $7E35E0
	bpl CODE_9B9FAE
	lda.w #$0000
	sta.l $7E35E0
CODE_9B9FAE:
	rtl
