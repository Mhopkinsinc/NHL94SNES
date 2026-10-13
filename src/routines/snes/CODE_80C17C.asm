; Unidentified routine.
CODE_80C17C:
	ldy.b $74
	jsr.w CODE_80C2DC
	sta.b $6C
	jsr.w CODE_80C232
	beq CODE_80C195
	ldy.b $08
CODE_80C18A:
	sty.w WMDATA
	dec a
	bne CODE_80C18A
	lda.b $6C
	jmp (DATA16_80BCF9,x)
