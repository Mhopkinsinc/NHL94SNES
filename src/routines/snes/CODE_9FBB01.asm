; Unidentified routine.
CODE_9FBB01:
	lda.w $1EBB
	bne CODE_9FBB4F
	lda.w sflags
	and.w #$0800
	bne CODE_9FBB4F
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	ldy.w #$0000
	lda.w #$0175
	sta.b $00
	jsr.w CODE_9FBB50
	ldy.w #$0002
	lda.w #$0178
	sta.b $00
	jsr.w CODE_9FBB50
	ldy.w #$0004
	lda.w #$017B
	sta.b $00
	jsr.w CODE_9FBB50
	ldy.w #$0006
	lda.w #$017E
	sta.b $00
	jsr.w CODE_9FBB50
	ldy.w #$0008
	lda.w #$0181
	sta.b $00
	jsr.w CODE_9FBB50
CODE_9FBB4F:
	rtl
