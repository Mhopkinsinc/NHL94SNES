; Unidentified routine.
CODE_9DBFB0:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$008E
	jsl.l CODE_9C9590
	lda.w #$009D
	sta.b $8F
	lda.w #$C4E8
	sta.b a1
	lda.w $1E81
	sta.b d0
	bpl CODE_9DBFD2
CODE_9DBFCF:
	jmp.w CODE_9DC0BB
