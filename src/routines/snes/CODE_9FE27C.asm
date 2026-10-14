; Unidentified routine.
CODE_9FE27C:
	lda.w MusicOn
	sta.w $0CBB
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	lda.b d7
	pha
	lda.b $85
	dec a
	dec a
	sta.w $0D53
	jsl.l CODE_9BAA60
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	pla
	sta.b d7
	sta.w $0ADB
CODE_9FE2AE:
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	lda.w #$0001
	rtl
