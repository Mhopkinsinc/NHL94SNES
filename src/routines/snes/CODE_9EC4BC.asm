; Unidentified routine.
CODE_9EC4BC:
	lda.w #$0006
	sta.b $A5
	lda.w #$8000
	tsb.w sflags
	bne CODE_9EC4A9
	lda.w RefCnt
	bpl CODE_9EC4A9
	jsl.l CODE_9EFA36
	bra CODE_9EC4A9
