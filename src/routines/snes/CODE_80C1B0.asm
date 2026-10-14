; Unidentified routine.
CODE_80C1B0:
	stz.b $6F
	lda.b $6C
	asl a
	dey
	beq .3
.1:
	bcc .7
	asl a
	rol.b $6F
	dey
	beq .4
.2:
	asl a
	rol.b $6F
	dey
	beq .5
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
.5:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	sta.b $6C
	lda.b $6F
	rts
.7:
	stx.b $00
	ldx.b #$02
.1x:
	asl a
	dey
	beq .5x
.2x:
	inx
	bcc .1x
	stx.b $04
.3x:
	asl a
	rol.b $6F
	dey
	beq .6
.4x:
	dex
	bne .3x
	sta.b $6C
	asl.b $04
	ldx.b $04
	lda.l DATA16_80C2BA-4,x
	ldx.b $00
	clc
	adc.b $6F
	sta.b $6F
	rts
.5x:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .2x
.6:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .4x
