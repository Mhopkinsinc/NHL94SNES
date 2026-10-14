; Unidentified routine.
CODE_9EDC44:
	phk
	plb
	lda.w $0D71
	sec
	sbc.w Xpos,x
	sta.b d0
	lda.w pucky
	sec
	sbc.w Ypos,x
	sta.b d1
	bra CODE_9EDC67

.t1:
	lda.w $0D71
	sta.b d0
	lda.w pucky
	sec
	sbc.b d4
	sta.b d1
CODE_9EDC67:
	lda.w Ypos,x
	bpl CODE_9EDC86
	cmp.w #$FEF8
	bmi CODE_9EDC85
	lda.w pucky
	cmp.w #$FEF8
	bmi .t1
	rts

.t1:
	lda.w #$0001
	sta.b d1
	rts
