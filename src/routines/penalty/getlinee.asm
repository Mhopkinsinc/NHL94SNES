; d0 = the average energy of line d0 of team a2
getlinee:
	lda.b d3
	pha
	lda.b d3+2
	pha
	lda.b d4
	pha
	lda.b d4+2
	pha
	lda.b a0
	pha
	lda.b a0+2
	pha
	lda.b a1
	pha
	lda.b a1+2
	pha
	ldy.b a2
	lda.w tmdata,y
	sta.b a1
	lda.w #TeamList>>16
	sta.b a1+2
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
	stz.b r2
	stz.b r1
	lda.w #priolist>>16
	sta.b a0+2
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
	inc.b r1
	lda.b a2
	beq .1
	lda.w #$0034
.1:
	adc.b d3
	tay
	lda.w tmpde-2,y
	adc.b r2
	sta.b r2
.3:
	dec.b d4
	bpl .2
	phx
	jsl.l Div16U
	plx
	lda.b r0
	sta.b d0
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d4+2
	pla
	sta.b d4
	pla
	sta.b d3+2
	pla
	sta.b d3
	rtl
