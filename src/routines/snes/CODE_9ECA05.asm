; Unidentified routine.
CODE_9ECA05:
	inc.b a2
	lda.b [a2]
	inc.w PlayerScrollCtr
	and.w #$00FF
	cmp.w #$0072
	bne CODE_9ECA17
	jmp.w CODE_9ECC4B
