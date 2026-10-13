; Unidentified routine.
CODE_9DBF83:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0084
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b $8D
	lda.w $1E7D
	sta.b $A5
	bpl CODE_9DBFA5
CODE_9DBFA2:
	jmp.w $C0BB
