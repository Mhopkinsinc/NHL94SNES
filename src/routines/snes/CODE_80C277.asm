; Unidentified routine.
CODE_80C277:
	ldy.b #$02
.1:
	asl a
	dex
	dex
	beq .5
.2:
	iny
	bcc .1
	sty.b $14
.3:
	asl a
	rol.b $6F
	dex
	dex
	beq .6
.4:
	dey
	bne .3
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
.5:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .2
.6:
	sep #$20
	lda.b ($0C)
	rep #$20
	inc.b $0C
	ldx.b #$10
	bra .4
