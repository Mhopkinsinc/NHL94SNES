; Unidentified routine.
CODE_80BDA6:
	asl a
CODE_80BDA7:
	asl a
CODE_80BDA8:
	asl a
CODE_80BDA9:
	asl a
CODE_80BDAA:
	asl a
CODE_80BDAB:
	asl a
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
CODE_80BDB4:
	asl a
CODE_80BDB5:
	asl a
	ldx.w $0500,y
	stx.w WMDATA
	stx.b $08
CODE_80BDBE:
	sta.b $6C
	ldy.b $6D
	ldx.w $0600,y
	jmp (DATA16_80BDC8,x)
