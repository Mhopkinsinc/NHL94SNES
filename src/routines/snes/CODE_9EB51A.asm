; Unidentified routine.
CODE_9EB51A:
	cmp.w #$D434
	bne CODE_9EB523
	jsl.l CODE_9C9BAB
CODE_9EB523:
	lda.b [a1]
	and.w #$00FF
	sta.b d2
	bne CODE_9EB52F
	jmp.w CODE_9EB6A5
