; Unidentified routine.
CODE_9ECCA1:
	lda.w $1E41
	jsl.l CODE_9BC5AB
	lda.w #$0000
	sta.b $97
	lda.w #mesarea
	sta.b a3
	lda.w #$0002
	sta.b [a3]
	jsl.l appstring
	lda.w #$009E
	sta.b $8F
	lda.w #ScoutFragments+18
	sta.b a1
	lda.w $1E41
	cmp.w #$000D
	beq .1
	cmp.w #$000E
	beq .1
	lda.w #$009E
	sta.b $8F
	lda.w #$CC94
	sta.b a1
.1:
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	bra CODE_9ECD36
