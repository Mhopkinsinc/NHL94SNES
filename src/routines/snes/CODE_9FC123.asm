; Unidentified routine.
CODE_9FC123:
	lda.b $A5
	cmp.w #$000B
	bmi CODE_9FC15D
	lda.b $AD
	sec
	sbc.w #$000A
	sta.b $A9
	cmp.w #$0100
	bmi CODE_9FC13C
	lda.w #$0100
	sta.b $A9
CODE_9FC13C:
	lda.b $A9
	sec
	sbc.w Vpos
	beq CODE_9FC15D
	lsr a
	lsr a
	lsr a
	lsr a
	bit.w #$0800
	beq CODE_9FC150
	ora.w #$F000
CODE_9FC150:
	cmp.w #$0000
	bne CODE_9FC156
	inc a
CODE_9FC156:
	clc
	adc.w Vpos
	sta.w Vpos
CODE_9FC15D:
	lda.b $B1
	sec
	sbc.w Hpos
	sta.b $A5
	cmp.w #$FFD8
	bpl CODE_9FC17E
	lda.b $B1
	sec
	sbc.w #$FFD8
	sta.b $A9
	cmp.w #$FFC4
	bpl CODE_9FC197
	lda.w #$FFC4
	sta.b $A9
	bra CODE_9FC197
