; Unidentified routine.
CODE_9DAB18:
	jsl.l SpriteFrameStart
	jsr.w CODE_9DABC1
	ldx.w #$004F
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF5A8
	sta.b a1
	jsl.l CODE_9C936C
	lda.l $7E3454
	cmp.w #$001C
	bpl CODE_9DAB51
	lda.w #$0001
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w VisTeam
	sta.b d1
	jsl.l CODE_9FBE08
CODE_9DAB51:
	lda.l $7E3452
	cmp.w #$001C
	bpl CODE_9DAB6F
	lda.w #$0016
	sta.w printx
	lda.w #$000A
	sta.w printy
	lda.w HomeTeam
	sta.b d1
	jsl.l CODE_9FBE08
CODE_9DAB6F:
	lda.l $7E3452
	bpl CODE_9DAB90
	lda.w #$0000
	sta.b $8F
	lda.w #$0A5C
	sta.b a1
	stz.b a2
	lda.w #$FFFF
	sta.b d1
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
CODE_9DAB90:
	lda.l $7E3454
	bpl CODE_9DABB4
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w #$0002
	sta.b a2
	lda.w #$FFFF
	sta.b d1
	ldx.w #$0008
	ldy.w #$0043
	jsl.l CODE_9C943E
CODE_9DABB4:
	jsl.l CODE_9DDDB3
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	rts
