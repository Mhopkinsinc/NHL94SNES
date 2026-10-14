; Unidentified routine.
CODE_9BB020:
	lda.w #$000F
	sta.w $0AF3
	jsl.l SoundVoicesOff
	pla
	sta.w Hpos
	pla
	sta.w Vpos
	pla
	sta.w $0D21
	pla
	sta.w ReplayBufferPtr
	lda.w #$0020
	trb.w sflags
	lda.w $0D21
	sta.b $9B
	lda.w ReplayBufferPtr
	sta.b a4
	jsl.l CODE_9BB19D
	lda.w #$0800
	trb.w sflags
	jsl.l SetHor
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	stz.w textdirtylo
	lda.w #$03FF
	sta.w textdirtyhi
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
.loop:
	lda.w $0AD3
	bne .loop
	lda.w SoundFadeSpeed
	bne .loop
	jsl.l CODE_8086A9
	lda.w $1D81
	bne CODE_9BB0C4
	lda.w $0CBB
	beq CODE_9BB0C4
	jsl.l CODE_9C978E
	lda.l $7E34BC
	beq .t1
	cmp.w #$0004
	beq .t1
	lda.l $7E35D4
	cmp.w #$0002
	bcc .t1
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w CODE_9BB0C4

.t1:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
CODE_9BB0C4:
	rtl
