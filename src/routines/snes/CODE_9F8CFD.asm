; Unidentified routine.
CODE_9F8CFD:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
CODE_9F8D0B:
	lda.w gmode
	eor.w #$0002
	sta.w gmode
	ldy.w #$0000
CODE_9F8D17:
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne CODE_9F8D25
	lda.w #$FFFE
	sta.w tmpdst,y
CODE_9F8D25:
	iny
	iny
	cpy.w #$0068
	bcc CODE_9F8D17
	jsl.l SetHor
	ldx.w #$0000
	ldy.w #$01C0
	lda.w #$6000
	jsl.l InitSprites
	jsl.l CODE_9F96E6
	jsl.l CODE_8086BD
	jsl.l SpriteFrameStart
	jsl.l CODE_9FBAAA
	jsl.l SpriteFrameEnd
	inc.w gsp
	lda.w gsp
	cmp.w #$0003
	beq CODE_9F8D70
	bcc CODE_9F8D7E
	lda.w #$0003
	sta.w gsp
	lda.l $7E34BC
	bne CODE_9F8D70
	lda.w #$0004
	sta.w gsp
CODE_9F8D70:
	lda.w $178E
	cmp.w $1790
	beq CODE_9F8D7E
	lda.w #$0004
	sta.w gsp
CODE_9F8D7E:
	jsl.l CODE_9FC683
	jsl.l UpdateScores
	jsl.l CODE_9FA2A6
	lda.w gsp
	cmp.w #$0004
	bne CODE_9F8D96
CODE_9F8D92:
	jml.l GameOver
