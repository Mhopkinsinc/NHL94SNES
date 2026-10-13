; Unidentified routine.
CODE_9BA6BE:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1CE
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF1DA
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9BA6F2:
	lda.w #$0014
	sta.w printx
	lda.w #$0015
	sta.w printy
	lda.w $19C6
	sta.b $A5
	lda.w #$0004
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.w $1DB9
	beq CODE_9BA724
CODE_9BA715:
	cmp.w #$0001
	beq CODE_9BA71F
	lda.w $19C6
	bra CODE_9BA727
