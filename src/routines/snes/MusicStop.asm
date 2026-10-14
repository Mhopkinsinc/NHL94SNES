; stop the song: release its voices and clear its tracks
MusicStop:		; stop the song: release its voices and clear its tracks
	php
	sep #$30
	lda.b #$FF
	sta.w SoundLock
	stz.w MusicOn
	stz.w $0801
	ldy.b #$07
	ldx.b #$0E
.loop:
	lda.w $08FA,y
	cmp.b #$10
	bcs .1
	lda.w $08F2,y
	beq .1
	jsr.w StopVoice
.1:
	dex
	dex
	dey
	bpl .loop
	ldy.b #$00
	ldx.b #$10
	jsr.w ClearTracks
	stz.w SoundLock
	plp
	rtl
