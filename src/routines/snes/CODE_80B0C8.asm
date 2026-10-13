; Unidentified routine.
CODE_80B0C8:
	ldy.w #$0016
	lda.b $14
	bit.w #$8000
	beq CODE_80B0D5
	jmp.w CODE_80B286
