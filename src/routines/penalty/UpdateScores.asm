; Update the ticker scores of the other playoff games
UpdateScores:
	jsl.l GetShifter
	lda.b d1
	sta.w TickerNum
	asl a
	sta.b a0
.loop:
	lda.b d1
	cmp.l gamenum
	beq .1
	ldx.b a0
	lda.l gsflags,x
	and.w #$FFFD
	sta.l gsflags,x
	bit.w #$0004
	bne .1
	jsl.l SetScore
.1:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .loop
	rtl
