; d0 = the period length in seconds for the period length option
GetPeriodTime:
	phx
	lda.l OptPerlen
	asl a
	tax
	lda.l GetPeriodTime_timetab,x
	sta.b d0
	plx
	rtl
