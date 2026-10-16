; Stop every voice that plays sound A
StopSound:
	phx
	phy
	phb
	php
	sep #$30
	dec.w SoundLock
	pha
	lda.b SoundBank
	pha
	plb
	pla
	asl a
	tay
	rep #$20
	lda.b [SoundTable],y
	clc
	adc.b SoundTable
	sta.b InstPtr
	ldx.b #$00
	txy
.loop:
	lda.w VoiceInst,x
	cmp.b InstPtr
	bne .1
	jsr.w StopVoice
.1:
	inx
	inx
	iny
	cpy.b #$08
	bne .loop
	sep #$20
	inc.w SoundLock
	plp
	plb
	ply
	plx
	rtl
