; d3 = the next game for the ticker, or negative when none is left
NewTicker2:
	lda.w TickerNum
	sta.b d3
	bmi .rtl
	dec.w TickerNum
	lda.b d3
	cmp.l $7E35D6
	beq NewTicker2
	bra NewTicker3
.rtl:
	rtl
