; Unidentified routine.
CODE_80BDF5:
	asl a
CODE_80BDF6:
	asl a
CODE_80BDF7:
	asl a
CODE_80BDF8:
	asl a
CODE_80BDF9:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BE02:
	asl a
CODE_80BE03:
	asl a
CODE_80BE04:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BE0D:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BE17,x)
