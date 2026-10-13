; Unidentified routine.
CODE_9B825A:
	lda.b #$01
	trb.w $1A0E
CODE_9B825F:
	lda.w $1A00
	and.b #$40
	beq CODE_9B826D
	lda.b #$01
	tsb.w $1A0C
	bra CODE_9B8277
