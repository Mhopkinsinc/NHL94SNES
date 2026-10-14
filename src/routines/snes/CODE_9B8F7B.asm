; Unidentified routine.
CODE_9B8F7B:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF081
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$000D
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	lda.w #$0011
	sta.w printx
	lda.w #$0002
	sta.w printy
CODE_9B8FB5:
	lda.w #DATA8_9B906F
	sta.b a1
	lda.w #$009B
	sta.b $8F
	lda.w $0D47
	sta.b d0
	lda.w SelectedPlayerIdx
	bne CODE_9B8FDF
	lda.w #$D8CD
	sta.b a1
	lda.w #$0080
	sta.b $8F
	bra CODE_9B8FDF
