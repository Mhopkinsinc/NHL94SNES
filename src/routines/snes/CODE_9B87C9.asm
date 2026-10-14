; Unidentified routine.
CODE_9B87C9:
	lda.l $7E34C6
	beq CODE_9B880D
	lda.b d0
	clc
	adc.w SelectedPlayerIdx
	dec a
	bmi CODE_9B880D
	cmp.w #$0007
	bcs CODE_9B880D
	inc a
	sta.w SelectedPlayerIdx
	cmp.w #$0006
	bmi CODE_9B87FB
	lda.w $1D9F
	cmp.w #$0004
	beq CODE_9B8809
	dec.w $1D9F
	lda.w $1D8B
	beq CODE_9B8809
	dec.w $1D8B
	bra CODE_9B8809
