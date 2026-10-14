; Unidentified routine.
CODE_9FC683:
	jsl.l GetPeriodTime
	lda.w $1D81
	beq CODE_9FC693
	lda.w #$0019
	sta.b d0
	bra CODE_9FC6A6
