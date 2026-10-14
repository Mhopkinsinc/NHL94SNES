; Unidentified routine.
CODE_9F9B61:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF81C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0009
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l CODE_9D8000
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9F9BD3
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF821
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w gsp
	sta.b d0
	cmp.w #$0004
	bne CODE_9F9BBB
	dec.w printx
	inc.b d0
CODE_9F9BBB:
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b a1
	jsl.l CODE_9ECFC6
	jsl.l CODE_9FBEFD
	jsl.l updatepwrplay
	bra CODE_9F9C05
