; Unidentified routine.
CODE_9FAF1E:
	lda.w $1003,x
	beq CODE_9FAF42
	clc
	adc.w #$0006
	lsr a
	lsr a
	lsr a
	sta.b $A5
	cmp.w #$0003
	bpl CODE_9FAF41
	lda.b $A5
	eor.w #$FFFF
	inc a
	clc
	adc.w #$000A
	sta.b $A5
	sta.l $7E3132
CODE_9FAF41:
	rtl
