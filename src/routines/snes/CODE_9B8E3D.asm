; Unidentified routine.
CODE_9B8E3D:
	jsl.l CODE_9B92DC
	lda.b d0
	sta.w $1DA3
	jsl.l GoalieCount
	lda.b d0
	sta.w $1DAB
CODE_9B8E4F:
	sta.w $1DA7
	lda.w #$0009
	cmp.w $1DA3
	beq CODE_9B8E5F
	bmi CODE_9B8E5F
	lda.w $1DA3
CODE_9B8E5F:
	sta.w $1DAF
	lda.w SelectedPlayerIdx
	dec a
	asl a
	asl a
	asl a
	sta.b d0
	jsl.l CODE_9B9320
	lda.b a3
	clc
	adc.b d0
	clc
	adc.w $1D9F
	sec
	sbc.w $1D8B
	sta.b a3
	jsr.w CODE_808D72
	sta.w $1D9B
	lda.w $1DAF
	clc
	adc.w $1DA7
	sec
	sbc.w $1D9B
	bpl CODE_9B8EAA
	lda.w $1D9B
	sec
	sbc.w $1DAF
	sec
	sbc.w $1DA7
	bmi CODE_9B8EA5
	clc
	adc.w $1DA7
	sta.w $1DA7
CODE_9B8EA5:
	lda.w #$0000
	bra CODE_9B8EB5
