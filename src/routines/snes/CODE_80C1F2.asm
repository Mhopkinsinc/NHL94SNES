; Unidentified routine.
CODE_80C1F2:
	stx.b $00
	ldx.b #$02
.1:
	asl a
	dey
	beq .5
.2:
	inx
	bcc .1
	stx.b $04
.3:
	asl a
	rol.b $6F
	dey
	beq .6
.4:
	dex
	bne .3
	sta.b $6C
	asl.b $04
	ldx.b $04
	lda.l DATA16_80C2BA-4,x
	ldx.b $00
	clc
	adc.b $6F
	sta.b $6F
	rts
.5:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .2
.6:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldy.b #$08
	bra .4
