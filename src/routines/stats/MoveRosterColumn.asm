; Move the roster attribute column by d0 and redraw.
MoveRosterColumn:
	lda.b d0
	clc
	adc.w DispAttribCtr
	sta.b d0
	bmi TeamRosterShowLine
	sta.w DispAttribCtr
	jsl.l ShowRosterLine
	bra TeamRosterShowLine
