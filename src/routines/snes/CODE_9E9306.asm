; Unidentified routine.
CODE_9E9306:
	ldy.b a2
	cpy.w #$0018
	beq CODE_9E931A
	lda.b d3
	sec
	sbc.w $0D3D
	cmp.w #$FF16
	bpl CODE_9E9305
	bra CODE_9E9325
