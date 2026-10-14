; Unidentified routine.
CODE_9F9A3B:
	lda.b $10
	clc
	adc.b $08
	tax
	lda.l DATA8_9F9AD8,x
	ldx.b d3
	jsl.l CODE_808F4C
	clc
	adc.b d0
	sta.b d0
	lda.b $14
	ldy.b $08
	beq CODE_9F9A57
	asl a
CODE_9F9A57:
	clc
	adc.b d1
	sta.b d1
CODE_9F9A5C:
	lda.b d2
	inc a
	cmp.w #$000F
	bpl CODE_9F9A67
	jmp.w CODE_9F9978
