; Unidentified routine.
CODE_9BC4DB:
	lda.w $1DB9
	cmp.w $1DC1
	beq CODE_9BC4F2
	jsr.w $C543
	inc.w printy
CODE_9BC4E9:
	lda.w $1DB9
	inc a
	sta.w $1DB9
	bra CODE_9BC4D0
