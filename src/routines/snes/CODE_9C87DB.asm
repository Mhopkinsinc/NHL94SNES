; Unidentified routine.
CODE_9C87DB:
	lda.b $91
	eor.w #$0002
	sta.b $91
	jsl.l CODE_9C8826
	jsl.l CODE_9C8B54
	jsl.l CODE_9C8B69
	jsl.l SpriteFrameStart
	ldx.b $91
	lda.w HomeTeam,x
	sta.l $7E3454
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2FB
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jsl.l WaitFrame
	jsl.l CODE_9C88A0
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	jmp.w CODE_808684
