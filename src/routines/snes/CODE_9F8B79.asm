; Unidentified routine.
CODE_9F8B79:
	ldx.w #$001C
	stx.b $95
	lda.w #$0018
	sta.b $A5
	jsl.l assinsert
	lda.w #$0001
	jsl.l CODE_9C9A7F
	stz.b $0C
	lda.w gsp
	cmp.w #$0002
	bcs CODE_9F8B9B
	jmp.w $8C96
