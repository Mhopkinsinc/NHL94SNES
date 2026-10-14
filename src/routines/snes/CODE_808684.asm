; Unidentified routine.
CODE_808684:
	jsl.l WaitFrame
	jsl.l IRQOff
	jsl.l ClearFrameHook
	jsl.l ClearNMIHook
	sep #$20
	lda.b #$8F
	sta.w IniDispShadow
	jsl.l WaitFrame
	stz.w HDMAEN
	rep #$20
	lda.b $3A
	sta.b $3C
	rtl
