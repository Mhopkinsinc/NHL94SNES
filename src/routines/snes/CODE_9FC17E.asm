; Unidentified routine.
CODE_9FC17E:
	lda.b $A5
	cmp.w #$0029
	bmi CODE_9FC1B8
	lda.b $B1
	sec
	sbc.w #$0028
	sta.b $A9
	cmp.w #$003D
	bmi CODE_9FC197
	lda.w #$003C
	sta.b $A9
CODE_9FC197:
	lda.b $A9
	sec
	sbc.w $0CEB
	beq CODE_9FC1B8
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9FC1AB
	ora.w #$F000
CODE_9FC1AB:
	cmp.w #$0000
	bne CODE_9FC1B1
	inc a
CODE_9FC1B1:
	clc
	adc.w $0CEB
	sta.w $0CEB
CODE_9FC1B8:
	rtl
