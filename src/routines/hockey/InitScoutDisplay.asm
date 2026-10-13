; Unidentified routine.
InitScoutDisplay:
	lda.w #$FFFF
	sta.w $0D49
	sta.w $0D3F
	stz.w $0D43
	stz.w $0D45
	lda.w #$007E
	sta.b $8B
	lda.w #$347C
	sta.b $89
	rtl
