; Unidentified routine.
CODE_9EDC5A:
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
	bmi CODE_9EDC7A
	rts
