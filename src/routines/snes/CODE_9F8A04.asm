; Unidentified routine.
CODE_9F8A04:
	cmp.w #$002C
	bmi CODE_9F8A14
	cmp.w #$0031
	bpl CODE_9F8A14
	lda.w #$002B
	stz.w $0EC3,x
CODE_9F8A14:
	sta.w Xpos,x
	lda.w Ypos,x
	bpl CODE_9F8A31
	cmp.w #$FF1C
	bmi CODE_9F8A44
	cmp.w #$FF21
	bpl CODE_9F8A44
	lda.w #$FF1B
	sta.w Ypos,x
	stz.w $0EE3,x
	bra CODE_9F8A44
