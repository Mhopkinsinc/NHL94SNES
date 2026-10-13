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
	lda.w Yvel,x
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
	sta.b $AD
	sta.w $0D4D
	lda.w Xpos,x
	sta.b $B1
	sta.w $0D4B
CODE_9FC102:
	lda.b $AD
	sec
	sbc.w Vpos
	sta.b $A5
	cmp.w #$FFF7
	bpl CODE_9FC123
	lda.b $AD
	sec
	sbc.w #$FFF6
	sta.b $A9
	cmp.w #$FF39
	bpl CODE_9FC13C
	lda.w #$FF39
	sta.b $A9
	bra CODE_9FC13C
