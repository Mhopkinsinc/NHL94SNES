; Unidentified routine.
CODE_9F8219:
	lda.b d4
	sta.w printx
	lda.w #$000F
	sta.w printy
	lda.w $1780,x
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b d4
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w $177E,x
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	ldx.w #$0068
	ldy.w #$0040
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7DE
	sta.b a1
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7E5
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9F8281:
	rtl
