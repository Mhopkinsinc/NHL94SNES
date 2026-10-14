; Unidentified routine.
CODE_9B8719:
	jsl.l CODE_9B8D86
	cmp.w #$0000
	bmi CODE_9B8725
	jsr.w CODE_9B8C7A
CODE_9B8725:
	lda.w #$0001
	sta.l $7E3468
	jsl.l CODE_9B8810
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFDB
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
	bne CODE_9B8769
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B88E9
	sta.b a1
CODE_9B8769:
	jsl.l AdvanceStringPtr
	jsl.l print
	jsl.l CODE_9DD923
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFE0
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jmp.w CODE_9B880D
