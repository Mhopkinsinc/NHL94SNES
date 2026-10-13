; Unidentified routine.
CODE_80B822:
	lda.w $2F40,x
	and.b #$40
	beq CODE_80B835
	lda.b #$08
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra CODE_80B822
