; Show the ticker box for game d3: round, period and both teams with their scores
NewTicker3:
	lda.b d3
	asl a
	sta.b a0
	tax
	lda.l gsflags,x
	bit.w #$0006
	bne NewTicker2
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #NewTicker3Pos>>16
	sta.b a1+2
	lda.w #NewTicker3Pos
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.w sflags
	bit.w #$0001
	bne .pj
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #NewTicker3Pos2>>16
	sta.b a1+2
	lda.w #NewTicker3Pos2
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
.pj:
	lda.w sfhormode
	bne .frame
	lda.w printy
	sec
	sbc.w #$0005
	sta.w printy
.frame:
	lda.w #$001C
	sta.b d0
	lda.w #$0005
	sta.b d1
	jsl.l Framer
	lda.b vcount
	sta.w tickervc
	inc.w printx
	lda.w printy
	sec
	sbc.w #$0004
	sta.w printy
	lda.w printx
	pha
	jsl.l GetShifter
	lda.w #$2400
	sta.w printa
	lda.b a1+2
	pha
	lda.b a1
	pha
	lda.w #NewTicker3Pos3>>16
	sta.b a1+2
	lda.w #NewTicker3Pos3
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b a1+2
	lda.b r0+1,s
	sta.w printx
	lda.l playoffRoundIdx
	inc a
	sta.b d0
	lda.l OptPlayMode
	bne .1
	stz.b d0
.1:
	lda.w #GameLabels>>16
	sta.b a1+2
	lda.w #GameLabels
	sta.b a1
	jsl.l PrintStringFromList
	lda.b r0+1,s
	clc
	adc.w #$0015
	sta.w printx
	ldx.b a0
	lda.l gsper,x
	dec a
	sta.b d0
	lda.w #PerLabels>>16
	sta.b a1+2
	lda.w #PerLabels
	sta.b a1
	jsl.l PrintStringFromList
	lda.w #$2000
	sta.w printa
	ldx.b a0
	lda.l gst1,x
	sta.b d0
	lda.l gss1,x
	sta.b d1
	jsl.l TickerTeam
	ldx.b a0
	lda.l gst2,x
	sta.b d0
	lda.l gss2,x
	sta.b d1
	jsl.l TickerTeam
	pla
	rtl
