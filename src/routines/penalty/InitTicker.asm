; Start the score ticker for the other games of the round
InitTicker:
	lda.w TickerNum
	bmi .1
	ora.l $7E35D6
	bne .2
.1:
	jsl.l GetShifter
	lda.b d1
	sta.w TickerNum
	bmi Intermission_rtl
.2:
	jmp.w NewTicker2
