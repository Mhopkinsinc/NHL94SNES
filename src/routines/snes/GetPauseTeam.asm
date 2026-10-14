; a2 = the team of the controller that owns the pause menu
GetPauseTeam:
	stz.b a2
	ldx.w pausepad
	lda.w $1C84,x
	cmp.w #$0002
	bne .rtl
	lda.w #$0002
	sta.b a2
.rtl:
	rtl
