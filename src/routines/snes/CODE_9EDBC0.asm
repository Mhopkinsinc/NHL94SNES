; Unidentified routine.
CODE_9EDBC0:
	lda.w Ypos,x
	cmp.w #$0108
	bpl CODE_9EDBEC
	cmp.w #$FEF8
	bmi CODE_9EDBEC
	cpx.w $0AD9
	bne CODE_9EDBD4
	stz.b d0
CODE_9EDBD4:
	lda.b d1
	cmp.w #$0103
	bmi CODE_9EDBE0
	lda.w #$0103
	sta.b d1
CODE_9EDBE0:
	lda.b d1
	cmp.w #$FEFD
	bpl CODE_9EDBEC
	lda.w #$FEFD
	sta.b d1
CODE_9EDBEC:
	lda.b d1
	sec
	sbc.b d3
	sta.b d1
CODE_9EDBF3:
	rtl
