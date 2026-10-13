; Unidentified routine.
CODE_9C9B8B:
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
