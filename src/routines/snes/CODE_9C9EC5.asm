; Unidentified routine.
CODE_9C9EC5:
	stz.b a2
	lda.w #$0002
	sta.b a1
	cpx.w #$001A
	bmi .1
	lda.w #$0002
	sta.b a2
	stz.b a1
.1:
	ldy.b a2
	lda.w tmscore,y
	ldy.b a1
	sec
	sbc.w tmscore,y
	sta.b d0
	lda.w #$0000
	sbc.w #$0000
	sta.b $A7
	cpx.w $1E23
	bmi .t1
	cpx.w $1E1F
	bne .2
	lda.w #$000B
	sta.b $0A
	lda.w #$71B0
	sta.b $08
	jsr.w CODE_9C9FC7
.2:
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2AF8
	jsl.l Mul16U
	plx
	jsr.w CODE_9C9FC7
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2774
	jsl.l Mul16U
	plx
	jsr.w CODE_9C9FC7
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$000A
	jsl.l Mul16U
	plx
	jsr.w CODE_9C9FC7
	bra CODE_9C9FB0

.t1:
	lda.b d0
	pha
	jsl.l GetPeriodTime
	lda.b d0
	phx
	ldx.w #$0028
	jsl.l DivX8U
	plx
	sta.b d1
	pla
	sta.b d0
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	cmp.b d1
	bmi CODE_9C9FB0
	sta.b $04
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$0064
	jsl.l CODE_808F4C
	sta.b $08
	jsl.l Div16U
	plx
	lda.b $00
	cmp.w #$0003
	bpl CODE_9C9FB0
	lda.w #$0000
	sta.b $0A
	lda.w #$7D00
	sta.b $08
	jsr.w CODE_9C9FC7
	lda.b $00
	cmp.w #$0000
	bne CODE_9C9FB0
	lda.w #$0001
	sta.b $0A
	lda.w #$24F8
	sta.b $08
	jsr.w CODE_9C9FC7
CODE_9C9FB0:
	lda.b $A7
	asl a
	sta.b $A7
	lda.b d0
	asl a
	lda.b $A7
	adc.w #$0000
	sta.b $A7
	lda.b d0
	and.w #$7FFF
	sta.b d0
	rtl
