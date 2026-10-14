; Unidentified routine.
CODE_80C1B0:
	stz.b $6F
	lda.b $6C
	asl a
	dey
	beq CODE_80C1CB
CODE_80C1B8:
	bcc CODE_80C1F2
	asl a
	rol.b $6F
	dey
	beq CODE_80C1D7
CODE_80C1C0:
	asl a
	rol.b $6F
	dey
	beq CODE_80C1E3
	sta.b $6C
	lda.b $6F
	rts
CODE_80C1CB:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra CODE_80C1B8
