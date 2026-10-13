; Unidentified routine.
GetPeriodTime:
	phx
	lda.l OptPerlen
	asl a
	tax
	lda.l GetPeriodTime_timetab,x
	sta.b $A5
	plx
	rtl
