; Unidentified routine.
CODE_9ED577:
	ldy.w #$0000
	cmp.w #$0014
	bcs CODE_9ED574
	lda.w #$005A
	sta.w $1543,x
	lda.w #$E66C
	jsl.l SetSPAFromA
CODE_9ED58C:
	rtl
