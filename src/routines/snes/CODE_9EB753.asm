; Unidentified routine.
CODE_9EB753:
	bpl CODE_9EB76A
	lda.w sflags
	bit.w #$4000
	bne CODE_9EB784
	jsl.l updatepwrplay_clr
	lda.w #$4000
	tsb.w sflags
	bra CODE_9EB784
