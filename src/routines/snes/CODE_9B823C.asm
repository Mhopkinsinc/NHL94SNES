; Unidentified routine.
CODE_9B823C:
	jsl.l Multi5ConnectCheck
	ldx.w #$000F
	stx.w $077A
	stx.w $077C
	stx.w $077E
	lda.w $1A00
	and.b #$80
	beq CODE_9B825A
	lda.b #$01
	tsb.w $1A0E
	bra CODE_9B825F
