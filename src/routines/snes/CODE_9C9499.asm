; Unidentified routine.
CODE_9C9499:
	cmp.w #$0040
	bne CODE_9C94A7
	lda.l DATA8_9C9623+$1B
	and.w #$00FF
	bra CODE_9C94CA
