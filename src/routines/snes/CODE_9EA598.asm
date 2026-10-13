; Unidentified routine.
CODE_9EA598:
	sec
	sbc.b $08
	sta.w $0EE3,x
	bpl CODE_9EA5A3
CODE_9EA5A0:
	stz.w $0EE3,x
CODE_9EA5A3:
	rtl
