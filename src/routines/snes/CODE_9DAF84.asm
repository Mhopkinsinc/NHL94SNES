; Unidentified routine.
CODE_9DAF84:
	jsl.l CODE_9DB0FD
	jsl.l SpriteFrameStart
	ldx.w #$0047
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #PlayerSelectAlt
	sta.b a1
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	rtl
