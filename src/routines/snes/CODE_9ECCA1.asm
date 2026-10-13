; Unidentified routine.
CODE_9ECCA1:
	lda.w $1E41
	jsl.l CODE_9BC5AB
	lda.w #$0000
	sta.b $97
	lda.w #$0A2A
	sta.b $95
	lda.w #$0002
	sta.b [$95]
	jsl.l appstring
	lda.w #$009E
	sta.b $8F
	lda.w #$CC9A
	sta.b $8D
	lda.w $1E41
	cmp.w #$000D
	beq CODE_9ECCDC
	cmp.w #$000E
	beq CODE_9ECCDC
	lda.w #$009E
	sta.b $8F
	lda.w #$CC94
	sta.b $8D
CODE_9ECCDC:
	jsl.l appstring
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	bra CODE_9ECD36
