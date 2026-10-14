; Unidentified routine.
CODE_9DBD36:
	lda.w $0BD5
	inc a
	cmp.w #$001A
	bcc CODE_9DBD45
	jsr.w CODE_9DBCF8
	lda.w #$0000
CODE_9DBD45:
	sta.w $0BD5
	asl a
	tax
	lda.l $7EF000,x
	rts
