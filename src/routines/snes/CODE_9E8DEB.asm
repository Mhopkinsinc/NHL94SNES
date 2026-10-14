; Unidentified routine.
CODE_9E8DEB:
	lsr a
	lsr a
	adc.b $CD
CODE_9E8DEF:
	cmp.w #$0041
	bcc CODE_9E8E3A
	sta.b d3
	lda.b d0
	xba
	and.w #$FF00
	tax
	lda.b d3
	jsl.l DivX8S
	cmp.w #$FF01
	bpl CODE_9E8E0B
	lda.w #$FF01
CODE_9E8E0B:
	cmp.w #$00FF
	bmi CODE_9E8E13
	lda.w #$00FF
CODE_9E8E13:
	sta.b d0
	lda.b d1
	xba
	and.w #$FF00
	tax
	lda.b d3
	jsl.l DivX8S
	ldx.b a3
	cmp.w #$FF01
	bpl CODE_9E8E2C
	lda.w #$FF01
CODE_9E8E2C:
	cmp.w #$00FF
	bmi CODE_9E8E34
	lda.w #$00FF
CODE_9E8E34:
	sta.b d1
	jsl.l CODE_9E8E91
CODE_9E8E3A:
	pla
	sta.b d2
	pla
	sta.b d3
	pla
	sta.b d4
	pla
	sta.b d5
	lda.w $1103,x
	ora.w $1123,x
	bne CODE_9E8E8A
	lda.w #$00FF
	sta.b d0
	stz.b d1
	lda.b d3
	dec a
	cmp.b d5
	bpl CODE_9E8E91
	lda.w #$FF01
	sta.b d0
	lda.w #$0000
	sec
	sbc.b d5
	dec a
	cmp.b d3
	bpl CODE_9E8E91
	stz.b d0
	lda.w #$FF01
	sta.b d1
	lda.b d2
	dec a
	cmp.b d4
	bpl CODE_9E8E91
	lda.w #$00FF
	sta.b d1
	lda.w #$0000
	sec
	sbc.b d4
	dec a
	cmp.b d2
	bpl CODE_9E8E91
CODE_9E8E8A:
	rtl
