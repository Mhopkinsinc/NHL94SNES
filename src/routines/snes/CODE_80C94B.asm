; Unidentified routine.
CODE_80C94B:
	lda.w #$000A
	sta.b d0
	lda.w $1D89
	bne CODE_80C958
	jmp.w CODE_80CA05
