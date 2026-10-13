; Unidentified routine.
CODE_80CAA9:
	sep #$20
	lda.w awayshooters
	rep #$20
CODE_80CAB0:
	and.w #$00FF
	dec a
	sta.w tmgoalie,y
	rtl
