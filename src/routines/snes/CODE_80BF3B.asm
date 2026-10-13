; Unidentified routine.
CODE_80BF3B:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BF44:
	asl a
CODE_80BF45:
	asl a
CODE_80BF46:
	asl a
CODE_80BF47:
	asl a
CODE_80BF48:
	asl a
CODE_80BF49:
	asl a
CODE_80BF4A:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BF53:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BF5D,x)
