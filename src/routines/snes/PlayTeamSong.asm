; Play song slot A of the home team (TeamSongs), or a random DefaultSongs song when it has none
PlayTeamSong:
	phx
	ldx.w MusicOn
	bne .2
	sta.b r3
	inc a
	pha
	lda.w HomeTeam
	asl a
	adc.w HomeTeam
	asl a
	clc
	adc.b r3
	asl a
	asl a
	tax
	lda.l TeamSongs+2,x
	bmi .t1
	sta.b p0+2
	lda.l TeamSongs,x
	sta.b p0
	jsl.l MusicStart
	bra .1

.t1:
	lda.w #$0008
	jsl.l randoma8
	asl a
	asl a
	tax
	lda.l DefaultSongs,x
	sta.b p0
	lda.l DefaultSongs+2,x
	sta.b p0+2
	jsl.l MusicStart
.1:
	pla
	sta.w cursong
.2:
	plx
	rtl
