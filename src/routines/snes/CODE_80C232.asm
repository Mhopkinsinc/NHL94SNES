; Unidentified routine.
CODE_80C232:
	stz.b $6F
	lda.b $6C
	asl a
	dex
	dex
	beq .3
.1:
	bcc CODE_80C277
	asl a
	rol.b $6F
	dex
	dex
	beq .4
.2:
	asl a
	rol.b $6F
	dex
	dex
	beq CODE_80C268
	sta.b $6C
	lda.b $6F
	rts
.3:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .1
.4:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .2
