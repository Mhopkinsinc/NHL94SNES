; Unidentified routine.
CODE_9B8384:
	lda.w #$0001
	trb.w $1A0E
CODE_9B838A:
	lda.w $1A00
	and.w #$0040
	beq CODE_9B839A
	lda.w #$0001
	tsb.w $1A0C
	bra CODE_9B83A0
