; per frame: fade, envelopes, and the song ticks that are due; nothing while SoundLock is set
SoundUpdate:		; per frame: fade, envelopes, and the song ticks that are due; nothing while SoundLock is set
	sep #$30
	lda.b $50
	pha
	plb
	lda.w SoundLock
	bne CODE_80ADE8
	rep #$20
	lda.w SoundFadeSpeed
	beq CODE_80ADC6
	lda.w SoundVolume
	sec
	sbc.w SoundFadeSpeed
	sta.w SoundVolume
	bcs .t1
	jsl.l SoundInit
	bra CODE_80ADC6

.t1:
	sep #$20
	jsr.w CODE_80A40F
CODE_80ADC6:
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
	jsr.w CODE_80AC7B
	lda.w MusicOn
	beq CODE_80ADE8
	jsr.w CODE_80AC4A
CODE_80ADE8:
	rts
