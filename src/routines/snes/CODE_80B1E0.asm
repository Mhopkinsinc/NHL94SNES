; Unidentified routine.
CODE_80B1E0:
	sta.b $26
	lda.w $07CE
	beq CODE_80B1F3
	lda.b $1C
	sec
	sbc.w $07C8
	sec
	sbc.w #$000F
	bra CODE_80B1FD
