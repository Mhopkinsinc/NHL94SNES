; Play sound A at once on the sound effect voices (the QueueSound set up without the replay record or the already-playing test)
PlaySound:
	phx
	phy
	phb
	php
	sep #$30
	pha
	dec.w SoundLock
	lda.b $50
	pha
	plb
	pla
	ldx.b #$10
	stx.b $4A
	ldx.b #$20
	stx.w CurTrackOfs
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	sta.w TrackInst,x
PlaySoundEntry:
	ldy.b #$06
	lda.b ($4E),y
	sta.b $5E
	sep #$20
	ldy.b #$05
	lda.b ($4E),y
	sta.b $60
	ldy.b #$2F
	lda.b ($4E),y
	sta.w TrackBendRange,x
	stz.w TrackBend,x
	lda.w SoundMono
	bne .t1
	ldy.b #$12
	lda.b ($4E),y
	sta.w TrackVolL+$10
	iny
	lda.b ($4E),y
	bra .1

.t1:
	ldy.b #$17
	lda.b ($4E),y
	sta.w TrackVolL+$10
.1:
	sta.w TrackVolR+$10
	lda.b $65
	sta.b $5A
	ldy.b #$10
	jsr.w StartSoundVoice
	and.b #$FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl

.stop:		; unused: release the voices playing sound A
	phx
	phy
	phb
	php
	sep #$30
	dec.w SoundLock
	pha
	lda.b $50
	pha
	plb
	pla
	asl a
	tay
	rep #$20
	lda.b [$34],y
	clc
	adc.b $34
	sta.b $4E
	ldx.b #$00
	txy
.2:
	lda.w VoiceInst,x
	cmp.b $4E
	bne .t1xx
	jsr.w ReleaseVoice
	bra .3

.t1xx:
	inx
	inx
	iny
	cpy.b #$08
	bne .2
.3:
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
