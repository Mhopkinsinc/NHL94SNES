; Unidentified routine.
CODE_9B8719:
	jsl.l CODE_9B8D86
	cmp.w #$0000
	bmi CODE_9B8725
	jsr.w $8C7A
CODE_9B8725:
	lda.w #$0001
	sta.l $7E3468
	jsl.l CODE_9B8810
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFDB
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
	bne CODE_9B8769
	lda.w #$009B
	sta.b $8F
	lda.w #DATA8_9B88E9
	sta.b $8D
CODE_9B8769:
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC7BE
	jsl.l CODE_9DD923
	lda.b $8F
	pha
	lda.b $8D
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CEFE0
	sta.b $8D
	jsl.l CODE_9EC7BE
	pla
	sta.b $8D
	pla
	sta.b $8F
	jmp.w $880D
