; Queue sound A for the sound driver
QueueSound:
	phx
	phy
	phb
	php
	pha
	sep #$30
	dec.w SoundLock
	lda.b SoundBank
	pha
	plb
	rep #$30
	lda.b r0+1,s
	sep #$10
	asl a
	tay
	lda.b [SoundTable],y
	clc
	adc.b SoundTable
	sta.b InstPtr
	ldx.b #$00
	txy
.1:
	lda.w VoiceInst,x
	cmp.b InstPtr
	beq .3
.2:
	inx
	inx
	iny
	cpy.b #$08
	bne .1
	ldx.b #$10
	stx.b CurTrack
	ldx.b #$20
	stx.w CurTrackOfs
	lda.b InstPtr
	sta.w TrackInst,x
	lda.w sflags
	bit.w #$0800
	bne .t1
	pla
	phx
	rep #$10
	ldx.w recsfx
	bmi .1x
	ldx.w recsfx
	stx.w recsfx2
	ldx.w recsfxpitch
	stx.w recsfxpitch2
	ldx.w recsfxvol
	stx.w recsfxvol2
.1x:
	sta.w recsfx
	sep #$10
	plx
	jmp.w PlaySoundEntry

.t1:
	pla
	jmp.w PlaySoundEntry
.3:
	lda.w VoiceState,y
	and.w #$00FF
	beq .2
	pla
	tya
	and.w #$00FF
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
