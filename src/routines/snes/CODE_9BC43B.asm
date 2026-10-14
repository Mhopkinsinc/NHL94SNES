; Unidentified routine.
CODE_9BC43B:
	rtl

.t1:
	lda.w #$0000
	sta.w $1DCD
.loop:
	lda.w $1DCD
	cmp.w #$FFFF
	bne .loop
	rts
