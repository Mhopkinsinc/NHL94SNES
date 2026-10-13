; Unidentified routine.
CODE_80AC7B:
	ldx.b #$00
	txy
CODE_80AC7E:
	sty.b $4B
	stx.w $0800
	lda.w $08F2,y
	bne CODE_80AC8B
	jmp.w CODE_80AD61
