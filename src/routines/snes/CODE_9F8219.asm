; Unidentified routine.
CODE_9F8219:
	lda.b $B5
	sta.w printx
	lda.w #$000F
	sta.w printy
	lda.w $1780,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	lda.b $B5
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w $177E,x
	sta.b $A5
	lda.w #$0003
	sta.b $A9
	jsl.l CODE_9FC623
	jsl.l CODE_9EC7BE
	ldx.w #$0068
	ldy.w #$0040
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7DE
	sta.b $8D
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7E5
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
CODE_9F8281:
	rtl
