; Pause menu Instant Replay
PauseReplay:
	lda.b d1
	bit.w #$8080
	bne .t1
	jmp.w PauseMenuPoll

.t1:
	lda.w MusicOn
	sta.w $0CBB
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
	jsl.l CODE_9F9708
	jsl.l forceblack
	lda.b d7
	pha
	lda.b $85
	dec a
	dec a
	sta.w $0D53
	jsl.l ReplayMode
	jsl.l CODE_9F96E6
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
