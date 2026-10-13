; Unidentified routine.
CODE_9EF28A:
	lda.w $17A8
	sec
	sbc.w tmap
	beq CODE_9EF2A5
	bmi CODE_9EF29E
	lda.w $175C
	inc a
	sta.w $175C
	bra CODE_9EF2A5
