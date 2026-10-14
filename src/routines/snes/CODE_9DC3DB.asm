; Unidentified routine.
CODE_9DC3DB:
	jsl.l GetPlayerRating
	lda.b d0
	dec a
	cmp.w $1E7B
	bpl .t1
	cmp.w $1E7F
	bpl .1
	cmp.w $1E83
	bpl .2
	bra .3

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
.1:
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
.2:
	lda.b d0
	sta.w $1E83
	lda.b d1
	sta.w $1E81
.3:
	rtl
