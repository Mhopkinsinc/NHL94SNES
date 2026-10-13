; Unidentified routine.
GetPeriodTimeRemaining:
	lda.w gsp
	xba
	and.w #$FF00
	asl a
	asl a
	asl a
	asl a
	asl a
	asl a
	ora.w $1C82
	sec
	sbc.w gameclock
	sta.b $A5
	rtl
