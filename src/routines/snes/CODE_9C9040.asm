; Unidentified routine.
CODE_9C9040:
	and.w #$00F0
	ora.w $1E15
	beq CODE_9C904C
	dec.b d0
	bmi CODE_9C9056
CODE_9C904C:
	lda.b a0
	clc
	adc.w #$0006
	sta.b a0
	bra CODE_9C9039
