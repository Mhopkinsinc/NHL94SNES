; Unidentified routine.
CODE_9D8129:
	lda.w #$0001
	sta.l $7E3474
	stz.w $1E3F
	jsl.l ClearTeamStats
	jsl.l CODE_9D87D7
	ldx.w #$0000
	jsl.l CODE_9DCC36
	ldx.w #$0002
	jsl.l CODE_9DCC36
	lda.w #$0008
	ldx.w #$003E
	jsl.l CODE_9DCCF5
	stz.w $1DB9
	stz.w $1E3D
	jsl.l CODE_9D8292
	jsl.l CODE_9D842F
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF390
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0016
	sta.b d0
	lda.w #$000B
	sta.b d1
	jsl.l CODE_9D80DD
	jsl.l ShowMatchups
	jsl.l CODE_9D8B49
	jsl.l ScreenOn
CODE_9D8195:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l CODE_9B8017
	ldx.w #$0002
	lda.w $0AB8
	sta.b $14
.loop:
	lda.w $1C84,x
	beq .1
	lda.w $0AB8,x
	ora.b $14
	sta.b $14
.1:
	inx
	inx
	cpx.w #$000A
	bcc .loop
	lda.b $14
	bit.w #$1000
	bne CODE_9D821A
	bit.w #$0800
	beq .2
	jsl.l CODE_9B866C
.2:
	bit.w #$4000
	bne CODE_9D8222
	bit.w #$8080
	bne CODE_9D8240
	bit.w #$0040
	beq .t1
	jmp.w CODE_9D825E

.t1:
	lda.w $1E3F
	bne .1x
	lda.w $1E3D
	inc a
	cmp.w #$012C
	bcs CODE_9D8246
	sta.w $1E3D
.1x:
	stz.w $1D5E
	lda.w JoyPad
	ora.w $0778
	bit.w #$0400
	beq .2x
	lda.w #$FFFF
	sta.w $1D5E
.2x:
	jsl.l UpdateScoutingDisplay
	lda.w $1E3F
	bne CODE_9D8217
	lda.l $7E34CC
	bne CODE_9D8217
	dec.w $0D41
	bmi CODE_9D821A
CODE_9D8217:
	jmp.w CODE_9D8195
CODE_9D821A:
	lda.w #$0000
	sta.l $7E3474
	rtl
CODE_9D8222:
	lda.w #$FFFF
	sta.w $1E3F
	lda.w $1DB9
	dec a
	bpl .1
	lda.w #$0006
	sta.w $1DB9
.1:
	sta.w $1DB9
	jsl.l ShowMatchups
	stz.w $1E3D
	bra CODE_9D8217
