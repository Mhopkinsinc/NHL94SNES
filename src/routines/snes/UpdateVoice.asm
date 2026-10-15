; Update voice Y: release it when its sound has ended
UpdateVoice:
	rep #$20
	lda.w VoiceLength,x
	bmi .1
	bne .t1
	sep #$20
	lda.w VoiceState,y
	cmp.b #$04
	beq .rts
	lda.w VoiceTrack,y
	phx
	tax
	lda.w TrackSustain,x
	plx
	cmp.b #$00
	bne .rts
	rep #$20
	jsr.w ReleaseVoice
	sep #$20
.rts:
	rts

.t1:
	dec.w VoiceLength,x
.1:
	sep #$20
	rts
