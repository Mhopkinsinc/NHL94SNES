; Unidentified routine.
CODE_80C15F:
	rep #$20
	inc.b $0C
	lda.b $6B
	jsr.w CODE_80C2DC
	sta.b $6C
	jsr.w CODE_80C232
	beq CODE_80C195
	ldy.b $08
CODE_80C171:
	sty.w WMDATA
	dec a
	bne CODE_80C171
	lda.b $6C
	jmp (DATA16_80BCF9,x)
