; Unidentified routine.
CODE_9C9B5F:
	phx
	ldx.w MusicOn
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
	bmi .t1
	sta.b $0E
	lda.l TeamSongs,x
	sta.b $0C
	jsl.l MusicStart
	bra CODE_9C9BA5

.t1:
	lda.w #$0008
	jsl.l CODE_9BB385
	asl a
	asl a
	tax
	lda.l DefaultSongs,x
	sta.b $0C
	lda.l DefaultSongs+2,x
	sta.b $0E
	jsl.l MusicStart
CODE_9C9BA5:
	pla
	sta.w $0CC3
CODE_9C9BA9:
	plx
	rtl
