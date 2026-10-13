; Unidentified routine.
CODE_9C9B5F:
	phx
	ldx.w $07F3
	bne CODE_9C9BA9
	sta.b $14
	inc a
	pha
	lda.w HomeTeam
	asl a
	adc.w HomeTeam
	asl a
	clc
	adc.b $14
	asl a
	asl a
	tax
	lda.l TeamSongs+2,x
	bmi CODE_9C9B8B
	sta.b $0E
	lda.l TeamSongs,x
	sta.b $0C
	jsl.l MusicStart
	bra CODE_9C9BA5
