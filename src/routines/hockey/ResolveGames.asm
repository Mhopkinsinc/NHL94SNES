; Record the played playoff game and the series wins
ResolveGames:
	lda.l $7E35D6
	asl a
	sta.b d0
	stz.b a0
	tax
	lda.w $178E
	sta.l $7E3578,x
	lda.w $1790
	sta.l $7E3588,x
	jsl.l GetShifter
	lda.b d1
	asl a
	sta.b a0
	lda.w $0ACF
	cmp.w #$0007
	bne CODE_9F94DA
	jmp.w CODE_9F961F
