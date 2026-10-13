; Unidentified routine.
CODE_80BD58:
	asl a
CODE_80BD59:
	asl a
CODE_80BD5A:
	asl a
CODE_80BD5B:
	asl a
CODE_80BD5C:
	asl a
CODE_80BD5D:
	asl a
CODE_80BD5E:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BD67:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BD70:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BD7A,x)
