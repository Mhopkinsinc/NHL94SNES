; Every frame of the scouting report: print the next word when its timer runs out
UpdateScoutingDisplay:
	lda.w ScoutingReportTimer
	sec
	sbc.w #$1000
	beq CODE_9EC96D
	bmi CODE_9EC96B
	bvs CODE_9EC96D
	bra CODE_9EC9B0
