; Unidentified routine.
CODE_80BE45:
	asl a
CODE_80BE46:
	asl a
CODE_80BE47:
	asl a
CODE_80BE48:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BE51:
	asl a
CODE_80BE52:
	asl a
CODE_80BE53:
	asl a
CODE_80BE54:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BE5D:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BE67,x)
