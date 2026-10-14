; Unidentified routine.
CODE_808520:
	php
	sei
	sep #$20
	pha
	lda.b #$81
	sta.w NMITIMEN
	pla
	rep #$20
	sty.w $07D2
	sty.w VTIMEL
	ldy.w $07D4
	sty.w HTIMEL
	sep #$10
	stx.w $0791
	sta.w $078F
	jsl.l WaitFrame
	sep #$20
	lda.b #$B1
	sta.w NMITIMEN
	plp
	cli
IRQHook_Off:
	rtl
