; End of a period: the winners celebrate, and the clock moves on
clockcont_0:
	ldx.w #$001C
	stx.b a3
	lda.w #$0018
	sta.b d0
	jsl.l assinsert
	lda.w #$0001
	jsl.l CODE_9C9A7F
	stz.b $0C
	lda.w gsp
	cmp.w #$0002
	bcs CODE_9F8B9B
	jmp.w CODE_9F8C96
