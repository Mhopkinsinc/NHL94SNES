; Animate the referee, and reprint the penalty message line when its time runs out
UpdatePA:
	lda.w RefCnt
	bmi .t1
	sec
	sbc.b d7
	sta.w RefCnt
	bpl .1
	jsl.l SetPA2
.1:
	lda.w penmsgtimer
	sec
	sbc.b d7
	sta.w penmsgtimer
	bpl .t1
	lda.w #$7FFF
	sta.w penmsgtimer
	jsl.l ClearPenaltyMessage
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #UpdatePAPos>>16
	sta.b a1+2
	lda.w #UpdatePAPos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	jsl.l GetPlayerName
	lda.b [a1]
	lsr a
	sta.b d0
	lda.w printx
	sec
	sbc.b d0
	sta.w printx
	jmp.w print

.t1:
	rtl
