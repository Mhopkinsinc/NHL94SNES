; Other scores screen
ShowOtherScores:
	lda.w #$001C
	sta.l $7E3454
	lda.w #$001D
	sta.l $7E3452
	jsl.l SetupScreen
	ldx.w #$0049
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #OtherScores
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l SpriteFrameEnd
	jsl.l SendColours
	stz.w $1DB9
	lda.w #$0000
	cmp.l $7E35D6
	bne .2
.1:
	inc a
.2:
	sta.w $1DBD
	jsl.l GetShifter
	lda.b d1
	inc a
	sta.w $1DC1
	jsl.l FillOtherScores
	jsl.l SendTextMap
	lda.w #$0050
	ldx.w #$00C0
	ldy.w #$00D8
	jsl.l SetupScrollIRQ
	jsl.l MenuScreenHDMA
	jsl.l ScreenOn
	lda.w #$0005
	sta.w $1DC5
	jsl.l DrawOtherScoresPage
CODE_9BC2C9:
	jsl.l ReadPausePad
	lda.b d3
	bit.w #$1000
	beq .t2
	jmp.w OtherScoresRtl

.t2:
	bit.w #$0800
	beq .t1
.1:
	jmp.w ScrollOtherScoresUp

.t1:
	bit.w #$0400
	bne ScrollOtherScoresDown
CODE_9BC2E4:
	lda.w $1DBD
	beq .3
	dec a
	bne .2
.1:
	cmp.l $7E35D6
	beq .3
.2:
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	asl a
	adc.w $1DBD
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #LineBraces
	sta.b a1
	jsl.l PrintToStatsPage
.3:
	lda.w $1DBD
	clc
	adc.w $1DC5
	clc
	adc.w $1DE9
	cmp.w $1DC1
	bpl .4
	lda.w #$0004
	sta.w printx
	lda.w $1DBD
	clc
	adc.w $1DC5
	dec a
	sta.b $14
	asl a
	adc.b $14
	inc a
	sta.w printy
	lda.w #$2000
	sta.w $0D0D
	lda.w #$009C
	sta.b $8F
	lda.w #LineBraces+3
	sta.b a1
	jsl.l PrintToStatsPage
.4:
	jsl.l DrawOtherScoresPage
	jsl.l WaitFrame
	jmp.w CODE_9BC2C9
