; Unidentified routine.
CODE_9FC0C6:
	lda.w $0D4F
	sec
	sbc.w $0CDD
	sta.w $0D4F
	cmp.w #$FFCF
	bpl CODE_9FC0DB
	lda.w #$FFCE
	sta.w $0D4F
CODE_9FC0DB:
	lda.w $0EE3,x
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0100
	beq CODE_9FC0ED
	ora.w #$FE00
CODE_9FC0ED:
	clc
	adc.w Ypos,x
	clc
	adc.w $0D4F
	sta.b d2
	sta.w yc1
	lda.w Xpos,x
	sta.b d3
	sta.w xc1
CODE_9FC102:
	lda.b d2
	sec
	sbc.w Vpos
	sta.b d0
	cmp.w #$FFF7
	bpl CODE_9FC123
	lda.b d2
	sec
	sbc.w #$FFF6
	sta.b d1
	cmp.w #$FF39
	bpl CODE_9FC13C
	lda.w #$FF39
	sta.b d1
	bra CODE_9FC13C
