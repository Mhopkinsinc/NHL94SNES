; Unidentified routine.
CODE_9F96F7:
	lda.w #$FFFF
	sta.w $0AD1
	ldx.w #$009C
	lda.w #$9971
	jsl.l CODE_80855E
	rtl
