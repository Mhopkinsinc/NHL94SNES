; Unidentified routine.
CODE_9ED6AE:
	lda.w pfgoal,x
	bne .t1
	lda.w #$0000
	sta.b $8B
	lda.w #$0D17
	sta.b a0
	lda.w #$0104
	sta.b d3
	lda.w #$0108
	sta.b d4
	bra .1

.t1:
	lda.w #$0D1B
	sta.b a0
	lda.w #$FEFC
	sta.b d3
	lda.w #$FEF8
	sta.b d4
.1:
	cpx.w shotPlIdx
	beq .t1x
	jsr.w CODE_9EDC44
	jsl.l vtoa
	jsl.l CODE_9EDC06
	bra .2

.t1x:
	lda.w $19D4,x
	bpl .2
	lda.w pfgoal,x
	eor.w #$0001
	asl a
	asl a
	sta.b d0
	jsl.l CODE_9EDC06
.2:
	lda.w Ypos,x
	cmp.w #$FEFB
	bmi .4
	cmp.w #$0105
	bpl .4
.3:
	lda.w $0D71
	sta.b d0
	lda.w pucky
	sta.b d1
	jsl.l CODE_9EDBC0
	lda.b d1
	cmp.w #$FFD2
	bmi CODE_9ED755
	cmp.w #$002E
	bpl CODE_9ED755
	lda.b d1
	pha
	lda.b d0
	pha
	jmp.w CODE_9ED7F1
.4:
	lda.w $19D4,x
	bpl .3
	stz.b d2
	stz.b d0
	lda.w Xpos,x
	cmp.w #$FFD3
	bmi .1x
	cmp.w #$002D
	bpl .1x
	lda.w #$0088
	sta.b d0
	lda.w Xpos,x
	bpl .1x
	lda.w #$FF78
	sta.b d0
.1x:
	jmp.w CODE_9EDA51
