; Unidentified routine.
NMI_FrameHookReturn:
	sep #$30
	jsl.l Multi5Bios
	rep #$20
	jsr.w SoundUpdate
	jsl.l CODE_9C9981
	rep #$30
	stz.b $38
	ply
	plx
	pla
	plb
	rti
