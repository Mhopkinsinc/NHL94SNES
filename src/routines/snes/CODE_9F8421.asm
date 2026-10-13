; Unidentified routine.
CODE_9F8421:
	lda.w #$0001
	sta.w $1EBB
CODE_9F8427:
	lda.w #$FFFF
	sta.w $1E8D
	lda.w $1D81
	beq CODE_9F8433
	rtl
