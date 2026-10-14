; Unidentified routine.
CODE_9EAF34:
	stx.b $14
	sty.b $16
	stz.b tmp0
	stz.b tmp1
	ldx.b $0E
	ldy.b $12
	cpx.b $14
	bpl .4
	lda.w #$0008
	sta.b tmp0
	cpy.b $14
	bpl .5
.1:
	rts
.2:
	cpy.b $16
	bmi .6
	lda.w #$0002
	sta.b tmp1
	bra .6
.3:
	cpy.w #$0024
	bmi .7
	lda.b tmp1
	ora.w #$0004
	sta.b tmp1
	bra .7
.4:
	cpy.b $14
	bpl .5
	lda.w #$0008
	sta.b tmp1
.5:
	cpx.b $16
	bmi .2
	lda.w #$0002
	sta.b tmp0
	cpy.b $16
	bpl .1
.6:
	ldx.b $0C
	ldy.b $10
	cpx.w #$0024
	bmi .3
	lda.b tmp0
	ora.w #$0004
	sta.b tmp0
	cpy.w #$0024
	bpl .1
.7:
	cpx.w #$FFDC
	bpl .2x
	lda.b tmp0
	ora.w #$0010
	sta.b tmp0
	cpy.w #$FFDC
	bmi .1
.1x:
	inc.b tmp2
	rts
.2x:
	cpy.w #$FFDC
	bpl .1x
	lda.b tmp1
	ora.w #$0010
	sta.b tmp1
	inc.b tmp2
	rts
