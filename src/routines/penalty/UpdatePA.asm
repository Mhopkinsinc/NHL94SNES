; Animate the referee, and reprint the penalty message line when its time runs out
UpdatePA:
	lda.w RefCnt
	bmi CODE_9EF968
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
	bpl CODE_9EF968
	lda.w #$7FFF
	sta.w penmsgtimer
	jsl.l CODE_9EC913
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #DATA8_9CF7A0>>16
	sta.b a1+2
	lda.w #DATA8_9CF7A0
	sta.b a1
	jsl.l CODE_9EC7BE
	pla
	sta.b a1
	pla
	sta.b a1+2
	jsl.l CODE_9FC3F8
	lda.b [a1]
	lsr a
	sta.b d0
	lda.w printx
	sec
	sbc.b d0
	sta.w printx
	jmp.w CODE_9EC7BE
