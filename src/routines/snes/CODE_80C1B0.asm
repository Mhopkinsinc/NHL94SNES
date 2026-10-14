; Unidentified routine.
CODE_80C1B0:
	stz.b $6F
	lda.b $6C
	asl a
	dey
	beq .3
.1:
	bcc CODE_80C1F2
	asl a
	rol.b $6F
	dey
	beq .4
.2:
	asl a
	rol.b $6F
	dey
	beq CODE_80C1E3
	sta.b $6C
	lda.b $6F
	rts
.3:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .1
.4:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .2
