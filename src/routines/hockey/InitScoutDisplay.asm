; Reset the scouting report text scroll
InitScoutDisplay:
	lda.w #$FFFF
	sta.w VertLineScrolling
	sta.w PlayerScrollCtr
	stz.w SelectedPlayerIdx
	stz.w ScoutingReportTimer
	lda.w #TestList>>16
	sta.b a0+2
	lda.w #TestList
	sta.b a0
	rtl
