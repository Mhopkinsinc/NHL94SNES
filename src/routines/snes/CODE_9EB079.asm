; Unidentified routine.
CODE_9EB079:
	lda.w $0AD9
	bmi CODE_9EB070
	lda.b $00
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9EB08B
	ora.w #$E000
CODE_9EB08B:
	tax
	jsl.l CODE_808F7D
	sta.b d0
	lda.b d1
	lsr a
	lsr a
	lsr a
	bit.w #$1000
	beq CODE_9EB09F
	ora.w #$E000
CODE_9EB09F:
	tax
	jsl.l CODE_808F7D
	ldx.b a3
	clc
	adc.b d0
	cmp.w #$000E
	bcc CODE_9EB070
	cmp.w #$0028
	bcs CODE_9EB0B6
	jmp.w CODE_9EA242
