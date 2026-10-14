; Scoring summary for both teams. Start leaves.
ShowScoringSummary:
	lda.w VisTeam
	sta.l $7E3454
	lda.w HomeTeam
	sta.l $7E3452
	jsl.l CODE_9DD9AD
	lda.w #$0000
	sta.w $1DB9
	sta.w $1DBD
	sta.w $1DC1
	ldx.w #$005E
	ldy.w #$0018
	lda.w #$009C
	sta.b $8F
	lda.w #ScoringLabel
	sta.b a1
	jsl.l CODE_9C936C
	jsl.l SpriteFrameEnd
	lda.w #$FFFF
	sta.l $7F75C2
	lda.w #$2BFF
	sta.l $7F7502
	lda.w #$6F7B
	sta.l $7F7522
	jsl.l CODE_9DE0D4
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ScoringSummaryHead
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w #$0000
	sta.w $1DC1
	lda.l $7E313A
.loop:
	cmp.w #$0006
	bmi .t1
.1:
	inc.w $1DC1
	sec
	sbc.w #$0006
	bra .loop

.t1:
	lda.w $1DC1
	cmp.w #$0006
	bcc .2
.1x:
	jsl.l PrintScrollHint
.2:
	jsr.w CODE_9B95B0
	jsl.l CODE_9DD923
	lda.w #$0058
	ldx.w #$00D0
	ldy.w #$00E0
	jsl.l CODE_9BCDF8
	jsl.l CODE_9DDFF6
	jsl.l CODE_8086BD
	lda.w #$0005
	sta.w $1DC5
	jsr.w DrawScoringPage
CODE_9B94A5:
	jsl.l CODE_9B851F
	lda.b d3
	bit.w #$1000
	beq .t1
	rtl

.t1:
	bit.w #$0800
	bne ScrollScoringUp
	bit.w #DMA_OAM
	bne ScrollScoringDown
CODE_9B94BB:
	jsl.l WaitFrame
	bra CODE_9B94A5
