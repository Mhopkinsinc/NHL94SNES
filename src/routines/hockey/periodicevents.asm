; Run every game loop; the slower checks once a second
periodicevents:
	jsl.l PenaltyManager
	jsl.l updatecrowdf
	jsl.l updatesound
	jsl.l clockcont
	lda.w sfhormode
	bne .rtl
	lda.w $0CF7
	sec
	sbc.b d7
	sta.w $0CF7
	bpl .rtl
	clc
	adc.w #$0018
	sta.w $0CF7
	jsl.l ChkGoalies
	jsl.l UpdateCwdExcite
	jsl.l CheckLateGameSong
	jsl.l RestoreBenchEnergy
	jsl.l CheckInjury
	jsl.l updatepwrplay
.rtl:
	rtl
