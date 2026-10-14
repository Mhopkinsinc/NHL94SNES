; Unidentified routine.
CODE_9EAB74:
	phb
	phk
	plb
	stz.b tmp2
	lda.w Xpos,x
	sta.b $0C
	lda.w Ypos,x
	sta.b $0E
	lda.b d0
	sta.b $10
	lda.b d1
	sta.b $12
	lda.w position,x
	bne CODE_9EAB93
	jmp.w CODE_9EADCF
