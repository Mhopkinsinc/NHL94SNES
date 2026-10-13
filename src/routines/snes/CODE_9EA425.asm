; Unidentified routine.
CODE_9EA425:
	cpx.w #$0018
	bcs CODE_9EA456
	lda.w attribute,x
	bit.w #$0800
	beq CODE_9EA43B
	lda.w #$0002
	sec
	sbc.w $1163,x
	bra CODE_9EA472
