; Play song slot A of the home team (TeamSongs), or a random DefaultSongs song when it has none
PlayTeamSong:
	phx
	ldx.w MusicOn
	bne .2
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
	bra .1

.t1:
	lda.w #$0008
	jsl.l randoma8
	asl a
	asl a
	tax
	lda.l DefaultSongs,x
	sta.b $0C
	lda.l DefaultSongs+2,x
	sta.b $0E
	jsl.l MusicStart
.1:
	pla
	sta.w $0CC3
.2:
	plx
	rtl
