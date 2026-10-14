; Unidentified routine.
CODE_9E9E8A:
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .1
	sta.w $19BE
.1:
	ldx.b a2
	lda.w #$FF7E
	sta.w Xpos,x
	lda.w #$0000
	sta.w Xvel,x
	lda.w attribute,x
	bit.w #$0800
	bne .t1
	lda.w #DATA8_9DFE60
	bra CODE_9E9EB4

.t1:
	lda.w #DATA8_9DFDFE
CODE_9E9EB4:
	sta.w pfalock,x
	jsl.l SetSPAFromA
	ldx.b a3
	ldy.b a2
	jmp.w CODE_9E9D79
