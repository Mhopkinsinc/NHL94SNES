; Unidentified routine.
CODE_9B8316:
	cmp.b #$1E
	bne CODE_9B831F
	lda.b #$02
	tsb.w $1A0E
CODE_9B831F:
	rts
	db "MODIFIED FROM SHVC MULTI5 BIOS Ver2.00"
	db "END OF MULTI5 BIOS"
