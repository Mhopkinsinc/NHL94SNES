; Unidentified routine.
CODE_80AA6D:
	sta.b $60
	ldy.b #$07
CODE_80AA71:
	lda.w $08FA,y
	cmp.b $4A
	beq CODE_80AA7B
	jmp.w CODE_80AAFE
