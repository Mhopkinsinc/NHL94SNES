; Unidentified routine.
CODE_9FB678:
	lda.b d1
	cmp.l $7E3138
	bpl CODE_9FB69D
	lda.w #$0041
	sta.l $7E3138
CODE_9FB687:
	lda.w #$0046
	sta.b d0
	lda.l $7E3136
	bpl CODE_9FB697
	lda.w #$FFBA
	sta.b d0
CODE_9FB697:
	lda.b d0
	sta.l $7E3136
CODE_9FB69D:
	rtl
