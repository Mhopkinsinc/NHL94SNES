; Unidentified routine.
CODE_9EB079:
	lda.w puckc
	bmi CODE_9EB070
	lda.b $00
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .1
	ora.w #$E000
.1:
	tax
	jsl.l CODE_808F7D
	sta.b d0
	lda.b d1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq .2
	ora.w #$E000
.2:
	tax
	jsl.l CODE_808F7D
	ldx.b a3
	clc
	adc.b d0
	cmp.w #$000E
	bcc CODE_9EB070
	cmp.w #$0028
	bcs .t1
	jmp.w CODE_9EA242

.t1:
	bra CODE_9EB070
