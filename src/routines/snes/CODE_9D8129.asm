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
.3:
	jsl.l CODE_9DD923
	jsl.l WaitFrame
	jsl.l ReadPads
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
	bne .5
	bit.w #$0800
	beq .2
	jsl.l CODE_9B866C
.2:
	bit.w #$4000
	bne .6
	bit.w #$8080
	bne .7
	bit.w #$0040
	beq .t1
	jmp.w .9

.t1:
	lda.w $1E3F
	bne .1x
	lda.w $1E3D
	inc a
	cmp.w #$012C
	bcs .8
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
	bne .4
	lda.l $7E34CC
	bne .4
	dec.w $0D41
	bmi .5
.4:
	jmp.w .3
.5:
	lda.w #$0000
	sta.l $7E3474
	rtl
.6:
	lda.w #$FFFF
	sta.w $1E3F
	lda.w $1DB9
	dec a
	bpl .1xx
	lda.w #$0006
	sta.w $1DB9
.1xx:
	sta.w $1DB9
	jsl.l ShowMatchups
	stz.w $1E3D
	bra .4
.7:
	lda.w #$FFFF
	sta.w $1E3F
.8:
	lda.w $1DB9
	inc a
	cmp.w #$0007
	bcc .1xxx
	lda.w #$0000
.1xxx:
	sta.w $1DB9
	jsl.l ShowMatchups
	stz.w $1E3D
	bra .4
.9:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF395
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0014
	sta.b d0
	lda.w #$0009
	sta.b d1
	lda.l $7E35D0
	sta.b d2
	jsl.l eraser
	jsl.l CODE_9D842F
	bra .4
