; Unidentified routine.
CODE_80B661:
	lda.b [$0C],y
	sta.b $14
	sep #$30
	lda.b #$00
CODE_80B669:
	tax
	lda.w $3032,x
	beq CODE_80B67E
	bmi CODE_80B675
	cmp.b $14
	bcs CODE_80B687
CODE_80B675:
	txa
	clc
	adc.w $3032,x
	and.b #$7F
	bra CODE_80B669
