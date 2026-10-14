; Unidentified routine.
CODE_9C9EC5:
	stz.b a2
	lda.w #$0002
	sta.b a1
	cpx.w #$001A
	bmi CODE_9C9ED8
	lda.w #$0002
	sta.b a2
	stz.b a1
CODE_9C9ED8:
	ldy.b a2
	lda.w $178E,y
	ldy.b a1
	sec
	sbc.w $178E,y
	sta.b d0
	lda.w #$0000
	sbc.w #$0000
	sta.b $A7
	cpx.w $1E23
	bmi CODE_9C9F48
	cpx.w $1E1F
	bne CODE_9C9F04
	lda.w #$000B
	sta.b $0A
	lda.w #$71B0
	sta.b $08
	jsr.w CODE_9C9FC7
CODE_9C9F04:
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
