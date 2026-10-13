; Unidentified routine.
CODE_9C8CA1:
	sep #$20
	lda.w $18EE,y
	rep #$20
	and.w #$00FF
	sta.b $A5
	sep #$20
	lda.w $1922,y
	rep #$20
	and.w #$00FF
	clc
	adc.b $A5
	sta.b $A5
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	sta.w $1DC9
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	clc
	adc.w $1DC9
	sta.w $1DC9
	lda.b $A5
	cmp.w $1DC9
	beq CODE_9C8D03
	bmi CODE_9C8D03
	bra CODE_9C8D0B
