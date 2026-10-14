; Unidentified routine.
CODE_9B8B42:
	lda.w $1D97
	cmp.w #$0000
	beq .t1
	bra .t2

.t1:
	lda.w #$FFFF
	bra CODE_9B8B5F

.t2:
	jsl.l CODE_9B9334
	jsr.w CODE_9B89E6
	jsl.l CODE_9B890F
	lda.w #$0000
CODE_9B8B5F:
	rts
