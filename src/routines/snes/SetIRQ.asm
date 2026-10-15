; Turn on an IRQ at line Y with the routine at X:A
SetIRQ:
	php
	sei
	sep #$20
	pha
	lda.b #$81
	sta.w NMITIMEN
	pla
	rep #$20
	sty.w IRQVTime
	sty.w VTIMEL
	ldy.w IRQHTime
	sty.w HTIMEL
	sep #$10
	stx.w IRQHook+2
	sta.w IRQHook
	jsl.l WaitFrame
	sep #$20
	lda.b #$B1
	sta.w NMITIMEN
	plp
	cli
IRQHook_Off:
	rtl
