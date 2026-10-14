; Unidentified routine.
CODE_9DBFDD:
	jsl.l AdvanceStringPtr
	ldx.w #$0040
	ldy.w #$0098
	jsl.l CODE_9C9590
	jmp.w CODE_9DC0BB
