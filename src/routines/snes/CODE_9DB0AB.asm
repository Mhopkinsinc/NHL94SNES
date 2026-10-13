; Unidentified routine.
CODE_9DB0AB:
	lda.w #$0020
	sta.l $7EA676
	sta.l $7EA678
	lda.w #$007E
	sta.b $0E
	lda.w #$A676
	sta.b $0C
	lda.w #$0800
	sta.w $079C
	lda.w #$0000
	sta.b $24
	lda.w #$0020
	sta.b $18
	lda.w #$0002
	sta.b $1A
	ldy.w printy
	sty.b $26
	ldx.w #$0000
	jsl.l CODE_808BED
	lda.w #$007E
	sta.b $0E
	lda.w #$4EF4
	sta.b $0C
	ldy.w #$4000
	lda.l $7E3466
	inc a
	asl a
	asl a
	asl a
	asl a
	tax
	jsl.l CODE_80891F
	rts
