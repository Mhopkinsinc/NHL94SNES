; Go to the next ticker game
TickerNext:
	lda.w $0D31
	bmi .1
	ora.l $7E35D6
	bne .2
.1:
	jsl.l GetShifter
	lda.b d1
	sta.w $0D31
	bmi CODE_9FA3BA
.2:
	jmp.w NewTicker2
