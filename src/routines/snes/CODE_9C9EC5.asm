; Unidentified routine.
CODE_9C9EC5:
	stz.b $91
	lda.w #$0002
	sta.b $8D
	cpx.w #$001A
	bmi CODE_9C9ED8
	lda.w #$0002
	sta.b $91
	stz.b $8D
CODE_9C9ED8:
	ldy.b $91
	lda.w tmscore,y
	ldy.b $8D
	sec
	sbc.w tmscore,y
	sta.b $A5
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
	jsr.w $9FC7
CODE_9C9F04:
	sep #$20
	lda.w $18EE,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2AF8
	jsl.l Mul16U
	plx
	jsr.w $9FC7
	sep #$20
	lda.w $1922,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$2774
	jsl.l Mul16U
	plx
	jsr.w $9FC7
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	phx
	ldx.w #$000A
	jsl.l Mul16U
	plx
	jsr.w $9FC7
	bra CODE_9C9FB0
