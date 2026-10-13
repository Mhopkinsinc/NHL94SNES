; Unidentified routine.
SoundInit:		; silence everything and reset the player; SoundVolume = $5000
	php
	sep #$20
	rep #$10
	lda.b #$FF
	sta.w SoundLock
	jsl.l SoundVoicesOff
	ldx.b $36
	stx.b $50
	ldx.w #$021A
CODE_80A395:
	stz.w $07EF,x
	dex
	bpl CODE_80A395
	ldx.w #$5000
	stx.w SoundVolume
	sep #$10
	ldy.b #$00
	ldx.b #$11
	jsr.w CODE_80A3D8
	ldy.b #$F6
CODE_80A3AC:
	dex
	bne CODE_80A3AC
	dey
	bne CODE_80A3AC
	jsr.w CODE_80A3F5
	lda.b #$12
	sta.w $07F6
	stz.w SoundLock
	stz.b $66
	plp
	rtl
