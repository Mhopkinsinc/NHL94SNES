; Team roster for the team in a2. Y switches team, start leaves.
TeamRoster:
	jsl.l CODE_9DE0E9
	ldy.b a2
	lda.w tmline,y
	inc a
	sta.b d0
	sta.w SelectedPlayerIdx
	stz.w $0D47
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$004C
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #TeamRosterTitle
	sta.b a1
	jsl.l CODE_9C936C
	jsl.l FadeIn
	jsl.l CODE_9DDFF6
	jsl.l ScreenOn
	lda.w #$007E
	sta.b $12
	lda.w #$37F4
	sta.b $10
	lda.l $7E35D0
	clc
	adc.l $7E35AA
	ldx.w #$0800
	jsl.l MemFill
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF431
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000F
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9D80DD
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF448
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000F
	sta.b d0
	lda.w #$0003
	sta.b d1
	jsl.l CODE_9D80DD
CODE_9D9DE2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF44D
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w HomeTeam
	sta.b d1
	lda.b a2
	beq .1
	lda.w VisTeam
	sta.b d1
	lda.w #$0030
.1:
	sta.b d0
	jsl.l CODE_9FBE08
	jsl.l SpriteFrameEnd
	lda.w #$7F97
	sta.l $7F7502
	lda.w #$FFFF
	sta.l $7F7542
	jsl.l SendColours
	jsl.l CODE_9D9ECB
CODE_9D9E2D:
	jsl.l SendTextMap
	jsl.l WaitFrame
	jsl.l ReadPads
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d1
	bit.w #$1000
	beq .t1
	jmp.w CODE_9DA04C

.t1:
	bit.w #$4000
	bne SwapRosterTeam
	stz.b d0
	inc.b d0
	bit.w #$0100
	bne MoveRosterColumn
	dec.b d0
	dec.b d0
	bit.w #$0200
	bne MoveRosterColumn
	bit.w #$0800
	bne .1
	inc.b d0
	inc.b d0
	bit.w #$0400
	beq CODE_9D9E86
.1:
	lda.b d0
	clc
	adc.w SelectedPlayerIdx
	sta.b d0
	bmi CODE_9D9E86
	cmp.w #$0008
	bcs CODE_9D9E86
	sta.w SelectedPlayerIdx
	jsl.l CODE_9D9ECB
CODE_9D9E86:
	jmp.w CODE_9D9E2D
