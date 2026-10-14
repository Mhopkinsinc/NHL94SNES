; NMI after the frame hook: Multi5Bios, SoundUpdate and the sound stream (UpdateStreamSfx), then restore and rti
NMI_FrameHookReturn:
	sep #$30
	jsl.l Multi5Bios
	rep #$20
	jsr.w SoundUpdate
	jsl.l UpdateStreamSfx
	rep #$30
	stz.b $38
	ply
	plx
	pla
	plb
	rti
