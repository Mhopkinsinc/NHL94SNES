; Unidentified routine.
CODE_9ED577:
	ldy.w #$0000
	cmp.w #$0014
	bcs CODE_9ED574
	lda.w #$005A
	sta.w pf2aip,x
	lda.w #DATA8_9DE66C
	jsl.l SetSPAFromA
CODE_9ED58C:
	rtl
