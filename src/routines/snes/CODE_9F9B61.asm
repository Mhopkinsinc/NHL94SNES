; Unidentified routine.
CODE_9F9B61:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF81C
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0009
	sta.b $A5
	lda.w #$0005
	sta.b $A9
	jsl.l CODE_9D8000
	lda.l $7E34BC
	cmp.w #$0004
	beq CODE_9F9BD3
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF821
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w gsp
	sta.b $A5
	cmp.w #$0004
	bne CODE_9F9BBB
	dec.w printx
	inc.b $A5
CODE_9F9BBB:
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b $8D
	jsl.l CODE_9ECFC6
	jsl.l CODE_9FBEFD
	jsl.l updatepwrplay
	bra CODE_9F9C05
