; Unidentified routine.
CODE_80A333:
	stz.w $07EF
	sep #$20
	ldy.b #$06
	lda.b [$0C],y
	sta.w $0801
	lda.b #$01
	sta.w MusicOn
	inc.w SoundLock
	plp
	rtl
