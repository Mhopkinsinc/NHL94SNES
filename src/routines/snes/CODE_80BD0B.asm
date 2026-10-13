; Unidentified routine.
CODE_80BD0B:
	asl a
CODE_80BD0C:
	asl a
CODE_80BD0D:
	asl a
CODE_80BD0E:
	asl a
CODE_80BD0F:
	asl a
CODE_80BD10:
	asl a
CODE_80BD11:
	asl a
CODE_80BD12:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BD23:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BD2D,x)
