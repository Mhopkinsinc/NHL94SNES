; Unidentified routine.
CODE_9C9F48:
	lda.b $A5
	pha
	jsl.l GetPeriodTime
	lda.b $A5
	phx
	ldx.w #$0028
	jsl.l DivX8U
	plx
	sta.b $A9
	pla
	sta.b $A5
	sep #$20
	lda.w $1956,x
	rep #$20
	and.w #$00FF
	cmp.b $A9
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
	lda.b $A5
	asl a
	lda.b $A7
	adc.w #$0000
	sta.b $A7
	lda.b $A5
	and.w #$7FFF
	sta.b $A5
	rtl
