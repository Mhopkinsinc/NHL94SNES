; Unidentified routine.
CODE_9FF667:
	jsr.w $F8D4
	lda.w #$0040
	tsb.b $C3
	lda.b $B9
	sta.b $B7
CODE_9FF673:
	jmp.w $F898
