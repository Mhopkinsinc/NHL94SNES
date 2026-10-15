; Pause menu Instant Replay
PauseReplay:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	lda.w MusicOn
	sta.w $0CBB
	jsl.l FadeOut
	jsl.l FadeOutSound
	jsl.l WaitFadeOut
	jsl.l forceblack
	lda.b d7
	pha
	lda.b $85
	dec a
	dec a
	sta.w vcountmark+2
	jsl.l ReplayMode
	jsl.l FadeIn
	jsl.l ScreenOn
	pla
	sta.b d7
	sta.w $0ADB
PauseSubmenuDone:
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	lda.w #$0001
	rtl
