; per frame: fade, envelopes, and the song ticks that are due; nothing while SoundLock is set
SoundUpdate:		; per frame: fade, envelopes, and the song ticks that are due; nothing while SoundLock is set
	sep #$30
	lda.b $50
	pha
	plb
	lda.w SoundLock
	bne .6
	rep #$20
	lda.w SoundFadeSpeed
	beq .5
	lda.w SoundVolume
	sec
	sbc.w SoundFadeSpeed
	sta.w SoundVolume
	bcs .t1
	jsl.l SoundInit
	bra .5

.t1:
	sep #$20
	jsr.w SeqCmd08Init_send
.5:
	sep #$20
	lda.w $07F1
	beq .2
.1:
	lda.w $07F8
	pha
	stz.w $07F8
.2:
	lda.w $07F1
	beq .4
.3:
	pla
	sta.w $07F8
.4:
	jsr.w UpdateSfxVoices
	lda.w MusicOn
	beq .6
	jsr.w SequencerTick
.6:
	rts
