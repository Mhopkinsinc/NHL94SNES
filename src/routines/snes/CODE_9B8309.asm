; Unidentified routine.
CODE_9B8309:
	and.b #$1E
	cmp.b #$02
	bne .t1
	lda.b #$04
	tsb.w $1A0E
	bra CODE_9B831F

.t1:
	cmp.b #$1E
	bne CODE_9B831F
	lda.b #$02
	tsb.w $1A0E
CODE_9B831F:
	rts
	db "MODIFIED FROM SHVC MULTI5 BIOS Ver2.00"
	db "END OF MULTI5 BIOS"
