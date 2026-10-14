; End of a period: the next period, overtime, or game over
PeriodOver:
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
	bne .5
	jsl.l CODE_9C978E
	lda.l $7E34BC
	beq .t1
	cmp.w #$0004
	beq .t1
	lda.l playoffRoundIdx
	cmp.w #$0002
	bcc .t1
	lda.w #$0093
	sta.b $0E
	lda.w #DATA8_93ED31
	sta.b $0C
	jsl.l MusicStart
	jmp.w .5

.t1:
	lda.w #$0090
	sta.b $0E
	lda.w #DATA8_90C20C
	sta.b $0C
	jsl.l MusicStart
.5:
	lda.w gmode
	eor.w #$0002
	sta.w gmode
	ldy.w #$0000
.loopx:
	lda.w tmpdst,y
	cmp.w #$FFFD
	bne .1
	lda.w #$FFFE
	sta.w tmpdst,y
.1:
	iny
	iny
	cpy.w #$0068
	bcc .loopx
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
	jsl.l ResetClock
	jsl.l UpdateScores
	jsl.l Intermission
	lda.w gsp
	cmp.w #$0004
	bne .t1x
.4:
	jml.l GameOver

.t1x:
	lda.w gsp
	sta.w $1EAD
	jsl.l CODE_9C9786
	jsl.l CODE_9F96F7
.loopxx:
	lda.w SoundFadeSpeed
	bne .loopxx
	jsl.l CODE_9C98DF
	lda.w #$FFFF
	sta.w $1E8D
	jmp.w CODE_9F8433
