; Turn the IRQ off, the NMI and pad reading on
IRQOff:
	sei
	php
	pha
	sep #$20
	lda.b #$81
	sta.w NMITIMEN
	stz.w $0791
	rep #$20
	lda.w #IRQHook_Off
	sta.w $078F
	pla
	plp
	cli
	rtl
