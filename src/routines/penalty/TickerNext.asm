; Go to the next ticker game
TickerNext:
	lda.w TickerNum
	bmi .1
	ora.l gamenum
	bne .2
.1:
	jsl.l GetShifter
	lda.b d1
	sta.w TickerNum
	bmi IntermissionTick_done
.2:
	jmp.w NewTicker2
