; Unidentified routine.
CODE_9EEB2E:
	jsl.l CODE_9FC757
	lda.w gmclock
	bne CODE_9EEB40
	ldy.b $91
	lda.w $17BE,y
	inc a
	sta.w $17BE,y
CODE_9EEB40:
	ldx.w $0B9D,y
	lda.w aidef,x
	lsr a
	clc
	adc.w #$0001
	adc.w temp1,x
	sta.w temp1,x
	lda.b $89
	sta.w $0D07
	ldx.b $89
	lda.w #$0015
	sta.b $A5
	jsl.l assinsert
	ldx.b $95
	ldy.b $89
	lda.w frame,y
	pha
	lda.w attribute,y
	bit.w #$0800
	beq CODE_9EEB7A
	lda.w #$0000
	sec
	sbc.w facedir,y
	bra CODE_9EEB7D
