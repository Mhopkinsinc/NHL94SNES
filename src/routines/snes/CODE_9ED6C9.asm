; Unidentified routine.
CODE_9ED6C9:
	lda.w #$0D1B
	sta.b a0
	lda.w #$FEFC
	sta.b d3
	lda.w #$FEF8
	sta.b d4
CODE_9ED6D8:
	cpx.w $0AD9
	beq CODE_9ED6EA
	jsr.w CODE_9EDC44
	jsl.l vtoa
	jsl.l CODE_9EDC06
	bra CODE_9ED6FD
