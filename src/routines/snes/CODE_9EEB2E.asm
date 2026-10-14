; Unidentified routine.
CODE_9EEB2E:
	jsl.l CODE_9FC757
	lda.w gmclock
	bne CODE_9EEB40
	ldy.b a2
	lda.w $17BE,y
	inc a
	sta.w $17BE,y
CODE_9EEB40:
	ldx.w $0B9D,y
	lda.w $1343,x
	lsr a
	clc
	adc.w #$0001
	adc.w $1003,x
	sta.w $1003,x
	lda.b a0
	sta.w $0D07
	ldx.b a0
	lda.w #$0015
	sta.b d0
	jsl.l assinsert
	ldx.b a3
	ldy.b a0
	lda.w $0D97,y
	pha
	lda.w attribute,y
	bit.w #$0800
	beq CODE_9EEB7A
	lda.w #$0000
	sec
	sbc.w facedir,y
	bra CODE_9EEB7D
