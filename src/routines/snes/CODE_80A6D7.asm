; Unidentified routine.
CODE_80A6D7:
	lda.b #$01
CODE_80A6D9:
	sta.w $08F2,x
	ldx.w $0800
	rep #$20
	lda.b $4E
	cmp.w #$E130
	bne CODE_80A6ED
	lda.w #$002D
	bra CODE_80A6EF
