; Move the referee and the game through a penalty
chkprogress:
	lda.w gmode
	bit.w #gmpen
	bne CODE_9EB3C5
CODE_9EB3C4:
	rtl
