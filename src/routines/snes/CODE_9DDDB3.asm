; Unidentified routine.
CODE_9DDDB3:
	lda.b $91
	pha
	lda.l $7E3454
	sta.b $00
	bpl CODE_9DDDFF
	lda.l $7E3452
	bpl CODE_9DDDC9
	lda.w #$0002
	sta.b $91
CODE_9DDDC9:
	lda.l $7E345C
	ldx.w #$0001
	ldy.w #$0001
	jsl.l CODE_9DC9A8
	lda.w #$007F
	sta.b $0E
	lda.w #$7780
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$3FF4
	sta.b $10
	lda.w #$0020
	sta.b $24
	ldx.w #$0001
	ldy.w #$0001
	lda.w #$0000
	jsl.l CODE_808E2D
	bra CODE_9DDE63
