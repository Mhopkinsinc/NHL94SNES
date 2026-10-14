; silence everything and reset the player; SoundVolume = $5000
SoundInit:
	php
	sep #$20
	rep #$10
	lda.b #$FF
	sta.w SoundLock
	jsl.l SoundVoicesOff
	ldx.b $36
	stx.b $50
	ldx.w #$021A
.loop:
	stz.w $07EF,x
	dex
	bpl .loop
	ldx.w #$5000
	stx.w SoundVolume
	sep #$10
	ldy.b #$00
	ldx.b #$11
	jsr.w ClearTracks
	ldy.b #$F6
.loop2:
	dex
	bne .loop2
	dey
	bne .loop2
	jsr.w SeqCmd08Init
	lda.b #$12
	sta.w $07F6
	stz.w SoundLock
	stz.b $66
	plp
	rtl
