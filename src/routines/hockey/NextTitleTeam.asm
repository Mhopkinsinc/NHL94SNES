; A = the next team of the shuffled list ($0BD5), shuffling again after the 26th
NextTitleTeam:
	lda.w TitleTeamIdx
	inc a
	cmp.w #$001A
	bcc .1
	jsr.w ShuffleTitleTeams
	lda.w #$0000
.1:
	sta.w TitleTeamIdx
	asl a
	tax
	lda.l titleteams,x
	rts
