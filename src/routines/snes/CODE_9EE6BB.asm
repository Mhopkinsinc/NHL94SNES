; Unidentified routine.
CODE_9EE6BB:
	phx
	ldx.b d0
	lda.l DATA8_9EE6C7+3,x
	plx
	and.w #$00FF
	rtl
