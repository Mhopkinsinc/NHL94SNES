; Playoffs: give the other games of the round scores so far
InitScores:
	lda.l playoffRoundIdx
	cmp.w #$0002
	bcs .5
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
.1:
	lda.b d1
	cmp.l $7E35D6
	beq .4
	ldx.b a0
	lda.l $7E3598,x
	bit.w #$0004
	bne .4
	lda.w #$0000
	sta.l $7E3568,x
	lda.w #$0003
	jsl.l randoma8
	inc a
	sta.b d0
	bra .3
.2:
	jsl.l SetScore
.3:
	dec.b d0
	bpl .2
.4:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .1
.5:
	rtl
