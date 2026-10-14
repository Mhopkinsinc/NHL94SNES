; release every voice
SoundVoicesOff:		; release every voice
	php
	sep #$30
	dec.w SoundLock
	ldy.b #$07
	ldx.b #$0E
.loop:
	jsr.w CODE_80ABC7
	dex
	dex
	dey
	bpl .loop
	inc.w SoundLock
	plp
	rtl
