; Unidentified routine.
CODE_9FCD2F:
	ldy.w #$0000
	cpx.w #$000C
	bcc .1
	ldy.w #$0002
.1:
	lda.w $1C94,y
	bne .t1
	rtl

.t1:
	lda.w #$0002
	ldy.w pfgoal,x
	bne CODE_9FCD69
	lda.w #$0001
	bra CODE_9FCD69
