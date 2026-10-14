; Player stats for the team in a2.
ShowPlayerStats:
	jsl.l CODE_9DE0E9
	lda.b a2
	pha
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #PlayerStatsTitle
	sta.b a1
	jsl.l CODE_9C936C
	jsl.l SpriteFrameEnd
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF2E1
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0800
	sta.w $0D0D
	lda.w #$000E
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
	lda.w #DATA8_9CF2E6
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0001
	sta.w $1DF9
	jsl.l CODE_9C8826
	lda.w #$0007
	sta.w $1DC5
	jsl.l CODE_9C8B54
	jsl.l CODE_9C8B69
	lda.w #$0058
	ldx.w #$00C0
	ldy.w #$00D0
	jsl.l CODE_9BCDF8
	lda.w #$0018
	sta.w $1DF5
	lda.w #$0001
	sta.l $7E3478
	jsl.l CODE_9DD923
	jsl.l CODE_9C88A0
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
CODE_9C8644:
	jsl.l CODE_9B8017
	jsl.l CODE_9B851F
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bit.w #$1000
	beq .t2
	jmp.w .t4

.t2:
	bit.w #$0800
	beq .t1
.1:
	jmp.w .t6

.t1:
	bit.w #DMA_OAM
	beq .t3
	jmp.w .t5

.t3:
	lda.b d1
	bit.w #$0200
	beq .t1x
.1x:
	jmp.w .t7

.t1x:
	bit.w #$0100
	beq .t2x
.1xx:
	jmp.w .t8

.t2x:
	bit.w #$4000
	beq .t1xx
.1x2:
	jmp.w SwapPlayerStatsTeam

.t1xx:
	lda.w $1DF9
	cmp.w #$0000
	beq .4
	lda.w $1DB9
	cmp.w $1DBD
	beq .1xxx
	lda.w #$0001
	sta.w printx
	lda.w $1DB9
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #LineBraces
	sta.b a1
	jsl.l CODE_9EC894
.1xxx:
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	cmp.w $1DC1
	beq .3
.2:
	lda.w #$0001
	sta.w printx
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	asl a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #LineBraces+3
	sta.b a1
	jsl.l CODE_9EC894
.3:
	jsl.l CODE_9C88A0
.4:
	jsl.l WaitFrame
	jmp.w CODE_9C8644

.t4:
	lda.w #$0000
	sta.l $7E3478
	pla
	sta.b a2
	rtl

.t5:
	jsl.l ClearPlayerStatBraces
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	cmp.w $1DC1
	bmi .t1x2
	jmp.w CODE_808684

.t1x2:
	inc.w $1DC5
	jsl.l CODE_9C88A0
	dec.w $1DC5
	jsl.l WaitFrame
	inc.w $1DB9
	lda.w #$0001
	sta.w $1DF3
.loop:
	jsl.l WaitFrame
	inc.w $1DF3
	inc.w $1DF3
	lda.w $1DF3
	cmp.w #$000D
	bne .loop
	jsl.l CODE_9C88A0
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9C8644

.t6:
	jsl.l ClearPlayerStatBraces
	lda.w $1DB9
	dec a
	cmp.w $1DBD
	bpl .t1x3
	jmp.w CODE_808684

.t1x3:
	sta.w $1DB9
	inc.w $1DC5
	jsl.l CODE_9C88A0
	dec.w $1DC5
	jsl.l WaitFrame
	lda.w #$000D
	sta.w $1DF3
.loopx:
	jsl.l WaitFrame
	dec.w $1DF3
	dec.w $1DF3
	lda.w $1DF3
	cmp.w #$0001
	bne .loopx
	jsl.l CODE_9C88A0
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w CODE_9C8644

.t7:
	lda.w $1DF9
	dec a
	bpl .t1x4
	jmp.w CODE_808684

.t1x4:
	cmp.w #$0000
	beq CODE_9C87C5
	bra CODE_9C87B7

.t8:
	lda.w $1DF9
	cmp.w #$0005
	bmi .t1x5
	jmp.w CODE_808684

.t1x5:
	inc a
	cmp.w #$0001
	beq CODE_9C87C5
CODE_9C87B7:
	sta.w $1DF9
	jsl.l CODE_9C8B69
	jsl.l CODE_9C88A0
	jmp.w CODE_808684
