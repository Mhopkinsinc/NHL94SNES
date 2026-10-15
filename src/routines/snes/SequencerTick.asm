; Advance the tempo: update the voices and step every track
SequencerTick:
	lda.w TempoAcc
	clc
	adc.b #$40
.loop:
	sta.w TempoAcc
	cmp.w TempoTick
	bcc .t1
	jsr.w UpdateVoices
	lda.w MusicPause
	bne .1
	ldx.w TrackCount
	beq .t1
	dex
.loop2:
	jsr.w StepTrack
	lda.w MusicOn
	beq .t1
	dex
	bpl .loop2
.1:
	lda.w TempoAcc
	sec
	sbc.w TempoTick
	bra .loop

.t1:
	rts
