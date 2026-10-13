; Unidentified routine.
CODE_80A5DF:
	cpy.b #$DF
	bne CODE_80A5F4
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5A
	lda.b [$56]
	inc.b $56
	tay
	sty.b $5E
	jmp.w CODE_80A60F
