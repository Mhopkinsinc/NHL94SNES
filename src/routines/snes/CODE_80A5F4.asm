; Unidentified routine.
CODE_80A5F4:
	cpy.b #$E5
	bne CODE_80A60F
	lda.b [$56]
	inc.b $56
	inc.b $56
	sta.b $5E
	jmp.w CODE_80A60F
