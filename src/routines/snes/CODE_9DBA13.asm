; Unidentified routine.
CODE_9DBA13:
	lda.w $0764
	cmp.w $0BDB
	bcc CODE_9DBA23
	lda.w $0BD9
	cmp.w #$0003
	bne CODE_9DBA24
CODE_9DBA23:
	rts
