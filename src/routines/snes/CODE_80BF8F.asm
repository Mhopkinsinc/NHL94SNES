; Unidentified routine.
CODE_80BF8F:
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sec
	sbc.w $0730
	tay
	sep #$20
	lda.w $0100,y
	ldy.b #$01
	cmp.b $73
	beq CODE_80BFC2
	jmp.w CODE_80C0E8
