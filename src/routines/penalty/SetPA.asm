; Start the referee animation for penalty d0 and show its message
SetPA:
	lda.b d0
	sta.w RefPen
	stz.w RefStep
	jsl.l CODE_9EC160
	lda.b d0
	cmp.w #PenGoal
	bne .0
	jsl.l CODE_9FA697
.0:
	lda.w #$7FFF
	sta.w penmsgtimer
	lda.w sfhormode
	beq SetPA2
	lda.w #$003C
	sta.w penmsgtimer
SetPA2:
	phx
	lda.b d0
	pha
	lda.b d0+2
	pha
	lda.b d1
	pha
	lda.b d1+2
	pha
	lda.b d2
	pha
	lda.b d2+2
	pha
	lda.b a0
	pha
	lda.b a0+2
	pha
	lda.b a1
	pha
	lda.b a1+2
	pha
	lda.w RefStep
	bpl .t1
	lda.w $1D81
	beq .skip
	lda.w #$0001
	sta.w $1D83
.skip:
	lda.w RefStep
	bra CODE_9EFA0F

.t1:
	sta.b d0
	inc.w RefStep
	inc.w RefStep
	lda.w RefPen
	sta.b d1
	tax
	lda.l DATA8_80D3EB,x
	inc a
	inc a
	tax
	clc
	adc.l DATA8_80D3EB,x
	adc.b d0
	tax
	lda.l DATA8_80D3EB,x
	sta.b d0
	bpl .1
	eor.w #$FFFF
	inc a
	sta.b d0
	lda.w #$FFFF
	sta.w RefStep
.1:
	lda.b d0
	and.w #$00FF
	asl a
	asl a
	asl a
	sta.b d1
	sta.w RefCnt
	lda.b d0
	xba
	and.w #$00FF
	sta.b d0
	jsl.l CODE_9EFA36
CODE_9EFA0F:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AF
	pla
	sta.b d2
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	plx
	rtl
