; Unidentified routine.
CODE_9BC174:
	txa
	lsr a
	ldy.b $B5
	sta.w $0AE7,y
	rtl
