; Unidentified routine.
CODE_9B8309:
	and.b #$1E
	cmp.b #$02
	bne .t1
	lda.b #$04
	tsb.w $1A0E
	bra .1

.t1:
	cmp.b #$1E
	bne .1
	lda.b #$02
	tsb.w $1A0E
.1:
	rts
	db "MODIFIED FROM SHVC MULTI5 BIOS Ver2.00"
	db "END OF MULTI5 BIOS"
