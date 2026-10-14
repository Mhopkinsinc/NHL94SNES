; Unidentified routine.
CODE_9FC896:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8DA
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$001D
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF8DF
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$007F
	sta.b $0E
	lda.w #$C800
	sta.b $0C
	lda.w #$0000
	sta.b $24
	lda.w #$0055
	sta.b $26
	lda.w #$0020
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.w #$0400
	sta.w $079C
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	lda.w #$007F
	sta.b $0E
	lda.w #$C800
	sta.b $0C
	lda.w #$0010
	sta.b $24
	lda.w #$0055
	sta.b $26
	lda.w #$0020
	sta.b $18
	lda.w #$001C
	sta.b $1A
	lda.w #$0800
	sta.w $079C
	ldx.w #$0000
	ldy.w #$0000
	jsl.l CODE_808BED
	jmp.w USBoard
