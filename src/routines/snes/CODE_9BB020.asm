; Unidentified routine.
CODE_9BB020:
	lda.w #$000F
	sta.w $0AF3
	jsl.l SoundVoicesOff
	pla
	sta.w $0CEB
	pla
	sta.w $0D37
	pla
	sta.w $0D21
	pla
	sta.w ReplayBufferPtr
	lda.w #$0020
	trb.w sflags
	lda.w $0D21
	sta.b $9B
	lda.w ReplayBufferPtr
	sta.b $99
	jsl.l CODE_9BB19D
	lda.w #$0800
	trb.w sflags
	jsl.l SetHor
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	stz.w $0CD5
	lda.w #$03FF
	sta.w $0CD7
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
CODE_9BB075:
	lda.w $0AD3
	bne CODE_9BB075
	lda.w $07F9
	bne CODE_9BB075
	jsl.l CODE_8086A9
	lda.w $1D81
	bne CODE_9BB0C4
	lda.w $0CBB
	beq CODE_9BB0C4
	jsl.l CODE_9C978E
	lda.l $7E34BC
	beq CODE_9BB0B6
	cmp.w #$0004
	beq CODE_9BB0B6
	lda.l $7E35D4
	cmp.w #$0002
	bcc CODE_9BB0B6
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w CODE_9BB0C4
