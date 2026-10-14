; Draw the period stats title and both teams' period columns.
DrawPeriodStats:
	jsl.l SpriteFrameStart
	jsl.l CODE_9DDDB3
	jsl.l WaitDMAQueue
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #PeriodStats
	sta.b a1
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7B3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0020
	sta.b d0
	lda.w #$0013
	sta.b d1
	lda.l $7E35B6
	sta.b d2
	jsl.l eraser
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7B8
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
	lda.w #DATA8_9CF7BD
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b d1
	jsl.l CODE_9FBE08
	lda.w #$000A
	sta.w printx
	ldx.w #$0000
	jsl.l .t3
	lda.w #$000E
	sta.w printx
	ldx.w #$0001
	jsl.l .t3
	lda.w #$0012
	sta.w printx
	ldx.w #$0002
	jsl.l .t3
	lda.w #$0016
	sta.w printx
	ldx.w #$0003
	jsl.l .t3
	lda.w #$001A
	sta.w printx
	ldx.w #$0004
	jsl.l .t3
	jsl.l SpriteFrameEnd
	rtl

.t3:
	lda.w printx
	sta.b d4
	lda.w #$2400
	sta.w $0D0D
	lda.w #$000C
	sta.w printy
	inc.w printx
	cpx.w #$0004
	bne .t1
	dec.w printx
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #TotalShotsLine
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	inc.w printy
	bra CODE_9F8197

.t1:
	cpx.w $1EAD
	beq .t2
	bmi .t2
	jmp.w CODE_808281

.t2:
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b a1
	stx.b d0
	jsl.l AdvanceStringPtr
	jsl.l print
CODE_9F8197:
	txa
	asl a
	asl a
	tax
	lda.w #$2000
	sta.w $0D0D
	lda.w $1DB9
	beq .t1
.1:
	lda.b d4
	sta.w printx
	lda.w #$000F
	sta.w printy
	lda.w $176C,x
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b d4
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w $176A,x
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	inc.w printy
	lda.w #$2400
	sta.w $0D0D
	ldx.w #$0068
	ldy.w #$0040
	lda.w #$009C
	sta.b $8F
	lda.w #$F7C9
	sta.b a1
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #$F7D0
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9F8281

.t1:
	lda.b d4
	sta.w printx
	lda.w #$000F
	sta.w printy
	lda.w $1780,x
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	lda.b d4
	sta.w printx
	lda.w #$0014
	sta.w printy
	lda.w $177E,x
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9FC623
	jsl.l print
	ldx.w #$0068
	ldy.w #$0040
	lda.w #$009C
	sta.b $8F
	lda.w #GoalsLabel
	sta.b a1
	jsl.l CODE_9C936C
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF7E5
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9F8281:
	rtl
