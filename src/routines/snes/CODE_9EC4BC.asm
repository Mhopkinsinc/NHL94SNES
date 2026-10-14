; Unidentified routine.
CODE_9EC4BC:
	lda.w #$0006
	sta.b d0
	lda.w #$8000
	tsb.w sflags
	bne CODE_9EC4A9
	lda.w RefCnt
	bpl CODE_9EC4A9
	jsl.l PushRef
	bra CODE_9EC4A9
