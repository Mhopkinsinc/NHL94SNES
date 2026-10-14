; Reset the game state for a new game, then start the first period
StartGame:
	jsl.l CODE_9D8BBF
CODE_9F8334:
	jsl.l CODE_9FE0E8
	jsl.l CODE_9D8129
CODE_9F833C:
	lda.w #$FFFF
	sta.w $07C6
	jsl.l CODE_9F96F7
	ldx.w #$0AD7
	lda.w #$0000
.loop:
	sta.b $00,x
	inx
	cpx.w #$1A11
	bne .loop
	ldx.w #$30F4
.loop2:
	sta.l $7E0000,x
	inx
	cpx.w #$3479
	bne .loop2
	lda.l $7E347A
	inc a
	sta.l $7E347A
	stz.w gmode
	lda.l OptPen
	cmp.w #$0001
	bne .1
	lda.w #$0020
	tsb.w gmode
.1:
	jsl.l ClearTeamStats
	jsl.l restoreteams
	jsl.l InitScores
	lda.w #$007E
	sta.w $0D21
	lda.w #$577E
	sta.w ReplayBufferPtr
	lda.w #$0010
	trb.w sflags
	lda.b a2
	pha
	lda.w #$0000
	sta.b a2
	jsl.l CODE_9B9334
	lda.w #$0002
	sta.b a2
	jsl.l CODE_9B9334
	pla
	sta.b a2
	lda.l $7E34C8
	sta.w $1C90
	sta.w $1C92
	lda.w #$0001
	sta.w $17E2
	sta.w $17E4
	stz.w $1E9B
	stz.w $1E9D
	stz.w $1EAD
	lda.w #$0001
	sta.l $7E344E
	stz.w $19D0
	stz.w $19D2
	ldx.w #$0008
.2:
	lda.w $1C84,x
	cmp.w #$0001
	bne .t1
	inc.w $19D0
	bra .3

.t1:
	cmp.w #$0002
	bne .3
	inc.w $19D2
.3:
	dex
	dex
	bpl .2
	jsl.l CODE_9FB69E
	stz.w $1EBB
	ldx.w #$0000
.loopx:
	lda.w $1C84,x
	dec a
	asl a
	sta.w $19F6,x
	inx
	inx
	cpx.w #$000A
	bcc .loopx
	ldx.w #$0000
.loop2x:
	lda.w $1C84,x
	bne .t1x
	inx
	inx
	cpx.w #$000A
	bcc .loop2x
	bra .4

.t1x:
	lda.w #$0001
	sta.w $1EBB
.4:
	lda.w #$FFFF
	sta.w $1E8D
	lda.w $1D81
	beq CODE_9F8433
	rtl
