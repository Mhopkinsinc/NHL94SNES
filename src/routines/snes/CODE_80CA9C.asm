; Unidentified routine.
CODE_80CA9C:
	ldy.b a2
	bne .t1
	sep #$20
	lda.w homeshooters
	rep #$20
	bra CODE_80CAB0

.t1:
	sep #$20
	lda.w awayshooters
	rep #$20
CODE_80CAB0:
	and.w #$00FF
	dec a
	sta.w tmgoalie,y
	rtl
