; Unidentified routine.
CODE_9B8F7B:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF081
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w #$0020
	sta.b $A5
	lda.w #$000D
	sta.b $A9
	lda.l $7E35D0
	sta.b $AD
	jsl.l eraser
	lda.w #$0011
	sta.w printx
	lda.w #$0002
	sta.w printy
CODE_9B8FB5:
	lda.w #DATA8_9B906F
	sta.b $8D
	lda.w #$009B
	sta.b $8F
	lda.w $0D47
	sta.b $A5
	lda.w $0D43
	bne CODE_9B8FDF
	lda.w #$D8CD
	sta.b $8D
	lda.w #$0080
	sta.b $8F
	bra CODE_9B8FDF
