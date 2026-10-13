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
	bcs CODE_80ADC1
	jsl.l SoundInit
	bra CODE_80ADC6
