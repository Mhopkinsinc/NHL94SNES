; Update the ticker scores of the other playoff games
UpdateScores:
	jsl.l GetShifter
	lda.b d1
	sta.w TickerNum
	asl a
	sta.b a0
.loop:
	lda.b d1
	cmp.l $7E35D6
	beq .1
	ldx.b a0
	lda.l $7E3598,x
	and.w #$FFFD
	sta.l $7E3598,x
	bit.w #$0004
	bne .1
	jsl.l SetScore
.1:
	dec.b a0
	dec.b a0
	dec.b d1
	bpl .loop
	rtl
