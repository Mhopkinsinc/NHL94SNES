; Unidentified routine.
CODE_9B8810:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFE5
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w SelectedPlayerIdx
	sta.b d0
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B8861
	sta.b a1
	lda.l $7E34C6
	bne CODE_9B8849
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B88E9
	sta.b a1
CODE_9B8849:
	jsl.l AdvanceStringPtr
	jsl.l print
	lda.b [a1]
	sta.b $B7
	ldy.w #$0002
	lda.b [a1],y
	sta.b d4
	jsr.w CODE_9B8B60
	rtl
