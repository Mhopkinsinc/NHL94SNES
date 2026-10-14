; Matchups screen
ShowMatchups:
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
	lda.w #MatchupsLabel
	sta.b a1
	jsl.l PrintLetterSprites
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
	bne .t1
	jmp.w .t2

.t1:
	dec.w $1DB9
	lda.w #$FFFF
	sta.l $7E3454
	sta.l $7E3452
	stz.b a2
	lda.w $1DB9
	sta.l $7E345A
	lda.w #$0002
	sta.b a2
	lda.w $1DB9
	sta.l $7E345C
	jsl.l CODE_9DDDB3
	lda.w #$3568
	sta.l $7F7500
	jsl.l SendColours
	lda.w #$0002
	sta.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b d0
	sta.w $1D9B
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3B8
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b d0
	jsl.l CODE_9FC427
	jsl.l print
	stz.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3BD
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DB9
	jsl.l CODE_9DC973
	lda.b d0
	sta.w $1D9B
	lda.w #$0001
	sta.b d1
	jsl.l CODE_9DC561
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1D9B
	sta.b d0
	jsl.l CODE_9FC427
	lda.w #$0021
	sec
	sbc.b [a1]
	sta.w printx
	jsl.l print
	inc.w $1DB9
	jmp.w .1

.t2:
	lda.w HomeTeam
	sta.l $7E3452
	lda.w VisTeam
	sta.l $7E3454
	jsl.l CODE_9DDDB3
	jsl.l SendColours
	lda.w #$0002
	sta.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3C7
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	stz.b a2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3D6
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	jsl.l CODE_9D87B5
	lda.b d0
	pha
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
.1:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3E5
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w $1DB9
	sta.b d0
	lda.w #$009D
	sta.b $8F
	lda.w #LineSlotNames
	sta.b a1
	jsl.l AdvanceStringPtr
	jsl.l print
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3EA
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	pla
	sta.b d0
	pla
	cmp.b d0
	beq .t2x
	bmi .t1x
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF3F8
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .2

.t1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF402
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra .2

.t2x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF40C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
.2:
	jsl.l WaitFrame
	jsl.l SpriteFrameEnd
	rtl
