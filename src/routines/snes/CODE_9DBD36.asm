; Unidentified routine.
CODE_9DBD36:
	lda.w $0BD5
	inc a
	cmp.w #$001A
	bcc .1
	jsr.w CODE_9DBCF8
	lda.w #$0000
.1:
	sta.w $0BD5
	asl a
	tax
	lda.l $7EF000,x
	rts
