; Unidentified routine.
CODE_9EDBC0:
	lda.w Ypos,x
	cmp.w #$0108
	bpl CODE_9EDBEC
	cmp.w #$FEF8
	bmi CODE_9EDBEC
	cpx.w puckc
	bne CODE_9EDBD4
	stz.b $A5
CODE_9EDBD4:
	lda.b $A9
	cmp.w #$0103
	bmi CODE_9EDBE0
	lda.w #$0103
	sta.b $A9
CODE_9EDBE0:
	lda.b $A9
	cmp.w #$FEFD
	bpl CODE_9EDBEC
	lda.w #$FEFD
	sta.b $A9
CODE_9EDBEC:
	lda.b $A9
	sec
	sbc.b $B1
	sta.b $A9
CODE_9EDBF3:
	rtl
