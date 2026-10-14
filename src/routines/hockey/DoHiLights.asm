; Playoffs: play the highlight of each game of the round that has one
DoHiLights:
	lda.l $7E34BC
	beq .rtl
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
.loop:
	ldx.b a0
	lda.l $7E3598,x
	bit.w #$0004
	bne .1
	bit.w #$0002
	beq .1
	and.w #$FFFD
	sta.l $7E3598,x
	jsl.l CODE_9F8DFA
.1:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .loop
.rtl:
	rtl
