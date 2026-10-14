; Unidentified routine.
CODE_9D8222:
	lda.w #$FFFF
	sta.w $1E3F
	lda.w $1DB9
	dec a
	bpl .1
	lda.w #$0006
	sta.w $1DB9
.1:
	sta.w $1DB9
	jsl.l ShowMatchups
	stz.w $1E3D
	bra CODE_9D8217
