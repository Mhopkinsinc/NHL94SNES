; Unidentified routine.
CODE_9FB601:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.w #$0000
	sta.b $8B
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
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
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
	cmp.l $7E3138
	bmi .3
	lda.w #$FFBF
	sta.l $7E3138
	bra .2

.t1:
	lda.b d1
	cmp.l $7E3138
	bpl .3
	lda.w #$0041
	sta.l $7E3138
.2:
	lda.w #$0046
	sta.b d0
	lda.l $7E3136
	bpl .1
	lda.w #$FFBA
	sta.b d0
.1:
	lda.b d0
	sta.l $7E3136
.3:
	rtl
