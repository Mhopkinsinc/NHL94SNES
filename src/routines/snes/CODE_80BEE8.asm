; Unidentified routine.
CODE_80BEE8:
	asl a
CODE_80BEE9:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BEF2:
	asl a
CODE_80BEF3:
	asl a
CODE_80BEF4:
	asl a
CODE_80BEF5:
	asl a
CODE_80BEF6:
	asl a
CODE_80BEF7:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BF00:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BF0A,x)
