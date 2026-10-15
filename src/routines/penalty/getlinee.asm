; d0 = the average energy of line d0 of team a2
getlinee:
	lda.b d3
	pha
	lda.b $B3
	pha
	lda.b d4
	pha
	lda.b $B7
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	ldy.b a2
	lda.w tmdata,y
	sta.b a1
	lda.w #$009C
	sta.b $8F
	ldy.w #$0006
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	lda.b d0
	asl a
	asl a
	asl a
	adc.b a1
	sta.b a1
	stz.b $08
	stz.b $04
	lda.w #priolist>>16
	sta.b $8B
	lda.w #priolist
	sta.b a0
	ldy.b a2
	lda.w tmap,y
	sta.b d4
	bra .3
.2:
	ldy.b d4
	lda.b [a0],y
	and.w #$00FF
	beq .3
	tay
	lda.b [a1],y
	and.w #$00FF
	asl a
	sta.b d3
	inc.b $04
	lda.b a2
	beq .1
	lda.w #$0034
.1:
	adc.b d3
	tay
	lda.w tmpde-2,y
	adc.b $08
	sta.b $08
.3:
	dec.b d4
	bpl .2
	phx
	jsl.l Div16U
	plx
	lda.b $00
	sta.b d0
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $B7
	pla
	sta.b d4
	pla
	sta.b $B3
	pla
	sta.b d3
	rtl
