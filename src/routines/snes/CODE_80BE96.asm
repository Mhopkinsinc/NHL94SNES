; Unidentified routine.
CODE_80BE96:
	asl a
CODE_80BE97:
	asl a
CODE_80BE98:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BEA1:
	asl a
CODE_80BEA2:
	asl a
CODE_80BEA3:
	asl a
CODE_80BEA4:
	asl a
CODE_80BEA5:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BEAE:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BEB8,x)
