; Unidentified routine.
CODE_9FC757:
	lda.w pfteam,x
	beq .t1
	stz.b a1
	lda.w #$0002
	sta.b a2
	rtl

.t1:
	lda.w #$0002
	sta.b a1
	stz.b a2
	rtl
