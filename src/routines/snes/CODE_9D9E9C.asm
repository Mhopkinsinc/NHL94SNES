; Unidentified routine.
CODE_9D9E9C:
	lda.b $91
	eor.w #$0002
	sta.b $91
	jsl.l SpriteFrameStart
	ldx.b $91
	lda.w HomeTeam,x
	sta.l $7E3454
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF452
	sta.b $8D
	jsl.l CODE_9C936C
	jsl.l CODE_9DDDB3
	jmp.w $9DE2
