; Show the ticker box for game d3: round, period and both teams with their scores
NewTicker3:
	lda.b d3
	asl a
	sta.b a0
	tax
	lda.l $7E3598,x
	bit.w #$0006
	bne NewTicker2
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF867
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.w sflags
	bit.w #$0001
	bne .pj
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF86C
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
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
	jsl.l CODE_9D8000
	lda.b $83
	sta.w $0D33
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
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #DATA8_9CF871
	sta.b a1
	jsl.l print
	pla
	sta.b a1
	pla
	sta.b $8F
	lda.b $01,s
	sta.w printx
	lda.l playoffRoundIdx
	inc a
	sta.b d0
	lda.l $7E34BC
	bne .1
	stz.b d0
.1:
	lda.w #$0080
	sta.b $8F
	lda.w #GameLabels
	sta.b a1
	jsl.l CODE_9ECFC6
	lda.b $01,s
	clc
	adc.w #$0015
	sta.w printx
	ldx.b a0
	lda.l $7E3568,x
	dec a
	sta.b d0
	lda.w #$0080
	sta.b $8F
	lda.w #PerLabels
	sta.b a1
	jsl.l CODE_9ECFC6
	lda.w #$2000
	sta.w printa
	ldx.b a0
	lda.l $7E3528,x
	sta.b d0
	lda.l $7E3578,x
	sta.b d1
	jsl.l TickerTeam
	ldx.b a0
	lda.l $7E3538,x
	sta.b d0
	lda.l $7E3588,x
	sta.b d1
	jsl.l TickerTeam
	pla
	rtl
