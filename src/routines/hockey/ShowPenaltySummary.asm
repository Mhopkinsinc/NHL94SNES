; Penalty summary for both teams. Start leaves.
ShowPenaltySummary:
	lda.w VisTeam
	sta.l setupvis
	lda.w HomeTeam
	sta.l setuphome
	jsl.l SetupScreen
	lda.w #$0000
	sta.w curitem
	sta.w listtop
	sta.w listend
	ldx.w #$0058
	ldy.w #$0018
	lda.w #PenaltiesLabel>>16
	sta.b $8F
	lda.w #PenaltiesLabel
	sta.b a1
	jsl.l PrintLetterSprites
	jsl.l SpriteFrameEnd
	lda.w #$FFFF
	sta.l colourbuf+$C2
	lda.w #$2BFF
	sta.l colourbuf+2
	lda.w #$6F7B
	sta.l colourbuf+$22
	jsl.l SendColours
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #PenaltySummaryHead>>16
	sta.b $8F
	lda.w #PenaltySummaryHead
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w PenSumLength
	sta.w listend
	lda.w listend
	cmp.w #$0006
	bcc .2
.1:
	jsl.l PrintScrollHint
.2:
	jsr.w FillPenaltyPage
	jsl.l SendTextMap
	lda.w #$0058
	ldx.w #$00D0
	ldy.w #$00E0
	jsl.l SetupScrollIRQ
	jsl.l MenuScreenHDMA
	jsl.l ScreenOn
	lda.w #$0005
	sta.w listrows
	jsr.w DrawPenaltyPage
PenaltySummaryLoop:
	jsl.l ReadPausePad
	jsl.l ProcessInputWithRepeat
	lda.b d3
	bit.w #$1000
	beq .t1
	rtl

.t1:
	bit.w #$0800
	bne ScrollPenaltyUp
	bit.w #$0400
	bne ScrollPenaltyDown
PenaltySummaryWait:
	jsl.l WaitFrame
	bra PenaltySummaryLoop
