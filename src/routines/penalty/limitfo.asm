; Keep the face off spot away from the blue line for every called penalty
limitfo:
	lda.b d0
	pha
	lda.b d0+2
	pha
	lda.b d1
	pha
	lda.b d1+2
	pha
	lda.b a0
	pha
	lda.b a0+2
	pha
	lda.b a1
	pha
	lda.b a1+2
	pha
	lda.w #PenBuf>>16
	sta.b a0+2
	lda.w #PenBuf
	sta.b a0
.loop:
	lda.b [a0]
	jsl.l .t2
	inc.b a0
	inc.b a0
	lda.b [a0]
	bne .loop
	pla
	sta.b a1+2
	pla
	sta.b a1
	pla
	sta.b a0+2
	pla
	sta.b a0
	pla
	sta.b d1+2
	pla
	sta.b d1
	pla
	sta.b d0+2
	pla
	sta.b d0
	rtl

.t2:
	and.w #$00FF
	cmp.w #$0034
	beq .3
	lda.b [a0]
	xba
	and.w #$007F
	asl a
	tay
	lda.w #$0058
	sta.b d1
	lda.w pfgoal,y
	bne .t1
	lda.w #$FFA8
	sta.b d1
	cmp.l foy
	bmi .3
	lda.w #$FFBF
	sta.l foy
	bra .2

.t1:
	lda.b d1
	cmp.l foy
	bpl .3
	lda.w #$0041
	sta.l foy
.2:
	lda.w #$0046
	sta.b d0
	lda.l fox
	bpl .1
	lda.w #$FFBA
	sta.b d0
.1:
	lda.b d0
	sta.l fox
.3:
	rtl
