; Unidentified routine.
CODE_9C9981:
	rep #$30
	lda.w $07E5
	and.w #$00FF
	bne CODE_9C99E4
	lda.w $1D68
	cmp.w #$0002
	beq CODE_9C99E4
	lda.w $15D6
	bne CODE_9C99A2
	lda.w $07F3
	beq CODE_9C999F
	bra CODE_9C99A2
