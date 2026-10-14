; Unidentified routine.
CODE_9D8489:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF39A
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$000B
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	jsl.l SpriteFrameStart
	ldx.w #$0056
	ldy.w #$0010
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF39F
	sta.b a1
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3A9
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w VisTeam
	sta.b d1
	jsl.l CODE_9FBE08
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3AE
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b d1
	jsl.l CODE_9FBE08
	lda.w $1DB9
	bne CODE_9D851D
	jmp.w CODE_9D8631
