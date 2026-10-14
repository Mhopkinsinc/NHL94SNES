; Unidentified routine.
CODE_9DC374:
	lda.w #$FFFF
	sta.w $1E79
	sta.w $1E7B
	sta.w $1E7D
	sta.w $1E7F
	sta.w $1E81
	sta.w $1E83
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9DC3DB
	lda.w #$0002
	sta.b d1
	jsl.l CODE_9DC3DB
	lda.w #$0006
	sta.b d1
	jsl.l CODE_9DC3DB
	lda.w #$0004
	sta.b d1
	jsl.l GetPlayerRating
	lda.b d0
	cmp.w #$0032
	bcc .t1
	lda.w #$0008
	sta.b d1
	jsl.l CODE_9DC3DB
	lda.w #$0009
	sta.b d1
	jsl.l CODE_9DC3DB
	bra .1

.t1:
	lda.w #$0007
	sta.b d1
	jsl.l CODE_9DC3DB
	lda.w #$000A
	sta.b d1
	jsl.l CODE_9DC3DB
.1:
	rtl
