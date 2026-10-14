; Unidentified routine.
CODE_9FBC5F:
	lda.w #$0082
	sta.b $12
	lda.w #SpriteFrames
	sta.b $10
	lda.w #$000C
	sta.b $91
CODE_9FBC6E:
	ldy.b $91
	lda.w $0AE7,y
	cmp.w #$000F
	bne CODE_9FBC7B
CODE_9FBC78:
	jmp.w CODE_9FBD47
