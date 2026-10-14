; Unidentified routine.
CODE_9EE5E6:
	lda.b d0
	cmp.w #$002C
	bpl CODE_9EE635
	jsl.l RandomWord
	and.w #$00C0
	beq .t1
	lda.w attribute,x
	bit.w #$0800
	bne CODE_9EE611
	bra CODE_9EE616

.t1:
	jsl.l RandomWord
	and.w #$00F0
	sta.b d0
	lda.w #$007F
	sec
	sbc.b d0
	bmi CODE_9EE616
CODE_9EE611:
	lda.w #$002D
	bra CODE_9EE619
