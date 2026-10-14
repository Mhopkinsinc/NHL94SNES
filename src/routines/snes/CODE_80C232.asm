; Unidentified routine.
CODE_80C232:
	stz.b $6F
	lda.b $6C
	asl a
	dex
	dex
	beq .3
.1:
	bcc .7
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
	beq .5
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
.5:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	sta.b $6C
	lda.b $6F
	rts
.7:
	ldy.b #$02
.1x:
	asl a
	dex
	dex
	beq .5x
.2x:
	iny
	bcc .1x
	sty.b $14
.3x:
	asl a
	rol.b $6F
	dex
	dex
	beq .6
.4x:
	dey
	bne .3x
	sta.b $6C
	txy
	lda.b $14
	and.w #$00FF
	asl a
	tax
	lda.l DATA16_80C2BA-4,x
	tyx
	clc
	adc.b $6F
	sta.b $6F
	rts
.5x:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .2x
.6:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .4x
