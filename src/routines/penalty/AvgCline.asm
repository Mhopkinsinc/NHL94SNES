; d0 = the average energy of team a2's current line
AvgCline:
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	lda.b d3
	pha
	lda.b $B3
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	stz.b d0
	stz.b d1
	lda.w #$0005
	sta.b d2
	sta.b d2
	ldy.b a2
	lda.w tmsort,y
	sta.b a0
.loop:
	ldy.b a0
	lda.w position,y
	beq .2
	bmi .2
	lda.w pnum,y
	and.w #$00FF
	asl a
	sta.b d3
	lda.b a2
	beq .1
	lda.w #$0034
.1:
	adc.b d3
	tay
	lda.w tmpde,y
	adc.b d0
	sta.b d0
	inc.b d1
.2:
	inc.b a0
	inc.b a0
	dec.b d2
	bpl .loop
	lda.b d1
	beq .3
	sta.b $04
	phx
	lda.b d0
	sta.b $08
	jsl.l Div16U
	lda.b $00
	sta.b d0
	plx
.3:
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $B3
	pla
	sta.b d3
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	rtl
