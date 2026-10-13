; Unidentified routine.
CODE_9DBA24:
	cmp.w #$0000
	bne CODE_9DBA44
	lda.w $0BDF
	dec a
	dec a
	cmp.w #$00B9
	bmi CODE_9DBA53
	dec.w $0BDF
	dec.w $0BDF
CODE_9DBA39:
	dec.w $0BE3
	dec.w $0BE3
	lda.w #$0002
	bra CODE_9DBABA
