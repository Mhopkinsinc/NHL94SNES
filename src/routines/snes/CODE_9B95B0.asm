; Unidentified routine.
CODE_9B95B0:
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldx.w #$4D80
	lda.l $7E35B6
	clc
	adc.l printfontset
	jsl.l CODE_808EDF
	lda.w #$007E
	sta.b $97
	lda.w #$313C
	sta.b a3
	lda.w #$0000
	sta.w printy
	pha
.loop:
	cmp.w $1DC1
	beq .t1
.1:
	jsr.w .t4
	lda.b a3
	clc
	adc.w #$0006
	sta.b a3
	inc.w printy
	pla
	inc a
	pha
	bra .loop

.t1:
	pla
	rts

.t4:
	lda.w #$0001
	sta.w printx
	lda.w #$2000
	sta.w $0D0D
	ldy.w #$0000
	lda.b [a3],y
	phy
	pha
	and.w #$F000
	xba
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	sta.b d0
	lda.w #$0080
	sta.b $8F
	lda.w #$D6E1
	sta.b a1
	jsl.l AdvanceStringPtr
	jsl.l CODE_9EC894
	lda.w #$0004
	sta.w printx
	pla
	and.w #$0FFF
	sta.b d0
	jsl.l PushTime
	lda.b [a1]
	cmp.w #$0006
	bne .1x
	inc.w printx
.1x:
	jsl.l CODE_9EC894
	lda.w #$000A
	sta.w printx
	ply
	iny
	iny
	sep #$20
	lda.b [a3],y
	rep #$20
	phy
	and.w #$00FF
	pha
	and.w #$00F0
	sta.b d3
	stz.b a2
	lda.b d3
	beq .2
	lda.w #$0002
	sta.b a2
.2:
	jsl.l CODE_9B9B35
	dec.w printy
	dec.w printy
	lda.w #$001C
	sta.w printx
	pla
	and.w #$000F
	cmp.w #$0000
	beq .t3
	cmp.w #$0001
	beq .t2
	cmp.w #$0002
	beq CODE_9B96FE
	cmp.w #$0003
	beq .t1x
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ScoringPP2
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9B96FE

.t1x:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ScoringPP
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9B96FE

.t2:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ScoringSH
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b a1
	pla
	sta.b $8F
	bra CODE_9B96FE

.t3:
	lda.b $8F
	pha
	lda.b a1
	pha
	lda.w #$009C
	sta.b $8F
	lda.w #ScoringSH2
	sta.b a1
	jsl.l CODE_9EC894
	pla
	sta.b a1
	pla
	sta.b $8F
CODE_9B96FE:
	ply
	iny
	sep #$20
	lda.b [a3],y
	rep #$20
	phy
	and.w #$00FF
	sta.b d0
	lda.w #$000E
	sta.w printx
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
	ply
	iny
	lda.w #$2400
	sta.w $0D0D
	sep #$20
	lda.b [a3],y
	rep #$20
	phy
	inc.w printy
	and.w #$00FF
	cmp.w #$00FF
	beq .1
	sta.b d0
	lda.w #$0010
	sta.w printx
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
.1:
	ply
	iny
	sep #$20
	lda.b [a3],y
	rep #$20
	inc.w printy
	and.w #$00FF
	cmp.w #$00FF
	beq .rts
	sta.b d0
	lda.w #$0010
	sta.w printx
	jsl.l CODE_9FC427
	jsl.l CODE_9EC894
.rts:
	rts
