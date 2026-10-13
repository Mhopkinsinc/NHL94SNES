; Unidentified routine.
CODE_9BAC9A:
	lda.w $0CBF
	clc
	adc.w #$0002
	cmp.w $0DD7
	bmi CODE_9BACA9
	lda.w $0DD7
CODE_9BACA9:
	cmp.w #$FF39
	bpl CODE_9BACB1
CODE_9BACAE:
	lda.w #$FF39
CODE_9BACB1:
	cmp.w #$0100
	bmi CODE_9BACB9
CODE_9BACB6:
	lda.w #$0100
CODE_9BACB9:
	sta.w $0D37
	sta.w $0CBF
	bra CODE_9BACCD
