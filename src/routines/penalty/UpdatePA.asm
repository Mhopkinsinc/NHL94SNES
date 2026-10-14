; Unidentified routine.
UpdatePA:
	lda.w RefCnt
	bmi CODE_9EF968
	sec
	sbc.b $C1
	sta.w RefCnt
	bpl CODE_9EF924
	jsl.l CODE_9EF991
CODE_9EF924:
	lda.w penmsgtimer
	sec
	sbc.b $C1
	sta.w penmsgtimer
	bpl CODE_9EF968
	lda.w #$7FFF
	sta.w penmsgtimer
	jsl.l CODE_9EC913
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7A0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jsl.l CODE_9FC3F8
	lda.b [$8D]
	lsr a
	sta.b $A5
	lda.w printx
	sec
	sbc.b $A5
	sta.w printx
	jmp.w CODE_9EC7BE
