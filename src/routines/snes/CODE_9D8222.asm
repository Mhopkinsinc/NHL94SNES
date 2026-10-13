; Unidentified routine.
CODE_9D8222:
	lda.w #$FFFF
	sta.w $1E3F
	lda.w $1DB9
	dec a
	bpl CODE_9D8234
	lda.w #$0006
	sta.w $1DB9
CODE_9D8234:
	sta.w $1DB9
	jsl.l CODE_9D8489
	stz.w $1E3D
	bra CODE_9D8217
