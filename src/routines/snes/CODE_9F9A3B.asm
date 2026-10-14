; Unidentified routine.
CODE_9F9A3B:
	lda.b $10
	clc
	adc.b $08
	tax
	lda.l DATA8_9F9AD8,x
	ldx.b $B1
	jsl.l CODE_808F4C
	clc
	adc.b $A5
	sta.b $A5
	lda.b $14
	ldy.b $08
	beq CODE_9F9A57
	asl a
CODE_9F9A57:
	clc
	adc.b $A9
	sta.b $A9
CODE_9F9A5C:
	lda.b $AD
	inc a
	cmp.w #$000F
	bpl CODE_9F9A67
	jmp.w CODE_9F9978
