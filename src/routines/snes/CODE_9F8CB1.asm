; Unidentified routine.
CODE_9F8CB1:
	jsl.l CODE_9F96F7
	jsl.l CODE_9C9786
	jsl.l WaitFrame
	jsl.l WaitFrame
.loop:
	lda.w $0AD3
	bne .loop
	lda.w SoundFadeSpeed
	bne .loop
	jsl.l CODE_8086A9
	lda.w $1D81
	bne CODE_9F8D0B
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
	jmp.w CODE_9F8D0B

.t1:
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
.loop:
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne .1
	lda.w #$FFFE
	sta.w tmpdst,y
.1:
	iny
	iny
	cpy.w #$0068
	bcc .loop
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
	beq .2
	bcc .3
	lda.w #$0003
	sta.w gsp
	lda.l $7E34BC
	bne .2
	lda.w #$0004
	sta.w gsp
.2:
	lda.w $178E
	cmp.w $1790
	beq .3
	lda.w #$0004
	sta.w gsp
.3:
	jsl.l CODE_9FC683
	jsl.l UpdateScores
	jsl.l CODE_9FA2A6
	lda.w gsp
	cmp.w #$0004
	bne .t1
.4:
	jml.l GameOver

.t1:
	lda.w gsp
	sta.w $1EAD
	jsl.l CODE_9C9786
	jsl.l CODE_9F96F7
.loopx:
	lda.w SoundFadeSpeed
	bne .loopx
	jsl.l CODE_9C98DF
	lda.w #$FFFF
	sta.w $1E8D
	jmp.w CODE_9F8433
