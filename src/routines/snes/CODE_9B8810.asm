; Unidentified routine.
CODE_9B8810:
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFE5
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	lda.w $0D43
	sta.b $A5
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B8861
	sta.b $8D
	lda.l $7E34C6
	bne CODE_9B8849
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B88E9
	sta.b $8D
CODE_9B8849:
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	lda.b [$8D]
	sta.b $B7
	ldy.w #$0002
	lda.b [$8D],y
	sta.b $B5
	jsr.w $8B60
	rtl
