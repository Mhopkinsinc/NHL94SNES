; Pause mode: save the screen, stop the sound, show the pause menu, then restore
Pausemode:
	phx
	lda.w #$007E
	sta.b $0E
	lda.w #$37F4
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$4F7E
	sta.b $10
	ldx.w #$0800
	jsl.l MemCopy
	plx
	jsl.l CODE_9C9786
	lda.w sfhormode
	pha
	lda.w sflags
	pha
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	jsl.l SetHor
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l SpriteFrameEnd
	stz.w $0D13
	stz.w $0D15
.loop:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF80E
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$0007
	sta.b d1
	jsl.l Framer
	jsl.l printscores1
	jsl.l PauseMenu
	bne .loop
	lda.w #$0000
	sta.l $7E3476
	stz.w $1EBB
	stz.w $1D60
	jsl.l CODE_9F96F7
	jsl.l CODE_9F9708
	jsl.l CODE_8086A9
	jsl.l SoundInit
	phx
	lda.w #$007E
	sta.b $0E
	lda.w #$4F7E
	sta.b $0C
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	ldx.w #$0800
	jsl.l MemCopy
	plx
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	pla
	sta.w sflags
	pla
	sta.w sfhormode
	bne .1
	jsl.l ClrHor
.1:
	lda.w #$0001
	trb.w sflags
	jsl.l printscores1
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	jsl.l SpriteFrameStart
	jsl.l setvideo
	jsl.l SpriteFrameEnd
	lda.w #$7000
	sta.b $64
	lda.w #$0012
	jsl.l CODE_80A17D
	lda.w #$0013
	jsl.l CODE_80A17D
	lda.w #$FFFF
	sta.w $0CAD
	sta.w $0CB3
	lda.b $83
	sta.w $0D35
	sta.w $0D01
	rtl
