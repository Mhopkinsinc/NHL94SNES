; Unidentified routine.
CODE_9EEA6F:
	lda.w passdir
	asl a
	asl a
	adc.w #$DA08
	sta.b $89
	lda.w #$0080
	sta.b $8B
	lda.b [$89]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l CODE_808F5D
	asl a
	sta.b $14
	ldx.b $E4
	lda.w $0EE3,x
	cmp.w #$8000
	ror a
	clc
	adc.b $14
	sta.w puckvy
	dec.b $89
	dec.b $89
	lda.b [$89]
	cmp.w #$8000
	ror a
	tax
	lda.w #$0050
	jsl.l CODE_808F5D
	asl a
	sta.b $14
	ldx.b $E4
	lda.w $0EC3,x
	cmp.w #$8000
	ror a
	clc
	adc.b $14
	sta.w puckvx
	jsl.l RandomWord
	and.w #$0FFF
	sta.w $0E01
CODE_9EEACC:
	lda.w position,x
	bne CODE_9EEAE9
	lda.w pfgoal,x
	beq CODE_9EEADD
	lda.w puckvy
	bmi CODE_9EEAE2
	bra CODE_9EEAE9
