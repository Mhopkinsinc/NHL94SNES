; Unidentified routine.
CODE_80B2D4:
	sta.b $26
	lda.b $14
	and.w #$4000
	beq CODE_80B2FA
	lda.w $07CE
	beq CODE_80B2EE
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$000F
	bra CODE_80B300
