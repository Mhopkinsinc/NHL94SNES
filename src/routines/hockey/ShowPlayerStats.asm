; Player stats for the team in a2.
ShowPlayerStats:
	jsl.l GetPauseTeam
	lda.b a2
	pha
	ldx.b a2
	lda.w HomeTeam,x
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l SetupScreen
	ldx.w #$0049
	ldy.w #$0018
	lda.w #PlayerStatsTitle>>16
	sta.b $8F
	lda.w #PlayerStatsTitle
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l SpriteFrameEnd
	jsl.l SendColours
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #ShowPlayerStatsPos>>16
	sta.b $8F
	lda.w #ShowPlayerStatsPos
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
	jsl.l FramerOutline
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #YSwitchTeamsTxt>>16
	sta.b $8F
	lda.w #YSwitchTeamsTxt
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0001
	sta.w $1DF9
	jsl.l SetPlayerStatsRange
	lda.w #$0007
	sta.w $1DC5
	jsl.l InitStatsOrder
	jsl.l SortPlayerStats
	lda.w #$0058
	ldx.w #$00C0
	ldy.w #$00D0
	jsl.l SetupScrollIRQ
	lda.w #$0018
	sta.w $1DF5
	lda.w #$0001
	sta.l $7E3478
	jsl.l SendTextMap
	jsl.l DrawPlayerStatsPage
	jsl.l MenuScreenHDMA
	jsl.l ScreenOn
ShowPlayerStats_loop:
	jsl.l ReadPads
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bit.w #$1000
	beq .t2
	jmp.w ShowPlayerStats_exit

.t2:
	bit.w #$0800
	beq .t1
.1:
	jmp.w ShowPlayerStats_up

.t1:
	bit.w #$0400
	beq .t3
	jmp.w ShowPlayerStats_down

.t3:
	lda.b d1
	bit.w #$0200
	beq .t1x
.1x:
	jmp.w ShowPlayerStats_left

.t1x:
	bit.w #$0100
	beq .t2x
.1xx:
	jmp.w ShowPlayerStats_right

.t2x:
	bit.w #$4000
	beq ShowPlayerStats_redraw
.1x2:
	jmp.w SwapPlayerStatsTeam

ShowPlayerStats_redraw:
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
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces
	sta.b a1
	jsl.l PrintToStatsPage
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
	lda.w #LineBraces>>16
	sta.b $8F
	lda.w #LineBraces+3
	sta.b a1
	jsl.l PrintToStatsPage
.3:
	jsl.l DrawPlayerStatsPage
.4:
	jsl.l WaitFrame
	jmp.w ShowPlayerStats_loop

ShowPlayerStats_exit:
	lda.w #$0000
	sta.l $7E3478
	pla
	sta.b a2
	rtl

ShowPlayerStats_down:
	jsl.l ClearPlayerStatBraces
	lda.w $1DB9
	clc
	adc.w $1DC5
	dec a
	cmp.w $1DC1
	bmi .t1x2
	jmp.w ShowPlayerStats_redraw

.t1x2:
	inc.w $1DC5
	jsl.l DrawPlayerStatsPage
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
	jsl.l DrawPlayerStatsPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w ShowPlayerStats_loop

ShowPlayerStats_up:
	jsl.l ClearPlayerStatBraces
	lda.w $1DB9
	dec a
	cmp.w $1DBD
	bpl .t1x3
	jmp.w ShowPlayerStats_redraw

.t1x3:
	sta.w $1DB9
	inc.w $1DC5
	jsl.l DrawPlayerStatsPage
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
	jsl.l DrawPlayerStatsPage
	jsl.l WaitFrame
	lda.w #$FFFF
	sta.w $1DF3
	jmp.w ShowPlayerStats_loop

ShowPlayerStats_left:
	lda.w $1DF9
	dec a
	bpl .t1x4
	jmp.w ShowPlayerStats_redraw

.t1x4:
	cmp.w #$0000
	beq ShowPlayerStats_setrange
	bra ShowPlayerStats_column

ShowPlayerStats_right:
	lda.w $1DF9
	cmp.w #$0005
	bmi .t1x5
	jmp.w ShowPlayerStats_redraw

.t1x5:
	inc a
	cmp.w #$0001
	beq ShowPlayerStats_setrange
ShowPlayerStats_column:
	sta.w $1DF9
	jsl.l SortPlayerStats
	jsl.l DrawPlayerStatsPage
	jmp.w ShowPlayerStats_redraw
ShowPlayerStats_setrange:
	sta.w $1DF9
	jsl.l SetPlayerStatsRange
	jsl.l InitStatsOrder
	jsl.l SortPlayerStats
	jsl.l DrawPlayerStatsPage
	jmp.w ShowPlayerStats_redraw
