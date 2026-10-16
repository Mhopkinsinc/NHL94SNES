; Update each active voice
UpdateVoices:
	ldx.b #$00
	txy
.loop:
	sty.b CurVoice
	stx.w VoiceOfs
	lda.w VoiceState,y
	beq .1
	lda.w VoiceTrack,y
	cmp.b #$10
	bcs .1
	jsr.w UpdateVoice
.1:
	inx
	inx
	iny
	cpy.b #$08
	bcc .loop
	rts
