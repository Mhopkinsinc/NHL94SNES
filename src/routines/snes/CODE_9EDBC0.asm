; Unidentified routine.
CODE_9EDBC0:
	lda.w Ypos,x
	cmp.w #$0108
	bpl .3
	cmp.w #$FEF8
	bmi .3
	cpx.w puckc
	bne .1
	stz.b d0
.1:
	lda.b d1
	cmp.w #$0103
	bmi .2
	lda.w #$0103
	sta.b d1
.2:
	lda.b d1
	cmp.w #$FEFD
	bpl .3
	lda.w #$FEFD
	sta.b d1
.3:
	lda.b d1
	sec
	sbc.b d3
	sta.b d1
CODE_9EDBF3:
	rtl
