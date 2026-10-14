; Unidentified routine.
CODE_9DC3DB:
	jsl.l CODE_9DC561
	lda.b d0
	dec a
	cmp.w $1E7B
	bpl .t1
	cmp.w $1E7F
	bpl CODE_9DC40F
	cmp.w $1E83
	bpl CODE_9DC42B
	bra CODE_9DC435

.t1:
	lda.w $1E7B
	sta.b $00
	lda.w $1E79
	sta.b $04
	lda.b d0
	sta.w $1E7B
	lda.b d1
	sta.w $1E79
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
CODE_9DC40F:
	lda.w $1E7F
	sta.b $00
	lda.w $1E7D
	sta.b $04
	lda.b d0
	sta.w $1E7F
	lda.b d1
	sta.w $1E7D
	lda.b $00
	sta.b d0
	lda.b $04
	sta.b d1
CODE_9DC42B:
	lda.b d0
	sta.w $1E83
	lda.b d1
	sta.w $1E81
CODE_9DC435:
	rtl
