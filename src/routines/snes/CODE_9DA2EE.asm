; Unidentified routine.
CODE_9DA2EE:
	jsl.l CODE_9B8017
	ldx.w #$0000
CODE_9DA2F5:
	lda.w $1A0E
	bne CODE_9DA302
	lda.w JoyPad,x
	and.w #$000F
	beq CODE_9DA30B
CODE_9DA302:
	lda.w #$0000
	sta.w $1C84,x
	jmp.w CODE_9DA486
