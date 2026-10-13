; Unidentified routine.
CODE_9DBFB0:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b $8D
	lda.w $1E81
	sta.b $A5
	bpl CODE_9DBFD2
CODE_9DBFCF:
	jmp.w $C0BB
