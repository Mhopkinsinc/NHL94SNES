; Advance the tempo: update the voices and step every track
SequencerTick:
	lda.w $07F5
	clc
	adc.b #$40
.loop:
	sta.w $07F5
	cmp.w $07F6
	bcc .t1
	jsr.w UpdateVoices
	lda.w $07F1
	bne .1
	ldx.w $0801
	beq .t1
	dex
.loop2:
	jsr.w StepTrack
	lda.w MusicOn
	beq .t1
	dex
	bpl .loop2
.1:
	lda.w $07F5
	sec
	sbc.w $07F6
	bra .loop

.t1:
	rts
