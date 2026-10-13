; Unidentified routine.
CODE_9E8DEB:
	lsr a
	lsr a
	adc.b $CD
CODE_9E8DEF:
	cmp.w #$0041
	bcc CODE_9E8E3A
	sta.b $B1
	lda.b $A5
	xba
	and.w #$FF00
	tax
	lda.b $B1
	jsl.l DivX8S
	cmp.w #$FF01
	bpl CODE_9E8E0B
	lda.w #$FF01
CODE_9E8E0B:
	cmp.w #$00FF
	bmi CODE_9E8E13
	lda.w #$00FF
CODE_9E8E13:
	sta.b $A5
	lda.b $A9
	xba
	and.w #$FF00
	tax
	lda.b $B1
	jsl.l DivX8S
	ldx.b $95
	cmp.w #$FF01
	bpl CODE_9E8E2C
	lda.w #$FF01
CODE_9E8E2C:
	cmp.w #$00FF
	bmi CODE_9E8E34
	lda.w #$00FF
CODE_9E8E34:
	sta.b $A9
	jsl.l CODE_9E8E91
CODE_9E8E3A:
	pla
	sta.b $AD
	pla
	sta.b $B1
	pla
	sta.b $B5
	pla
	sta.b $B9
	lda.w $1103,x
	ora.w $1123,x
	bne CODE_9E8E8A
	lda.w #$00FF
	sta.b $A5
	stz.b $A9
	lda.b $B1
	dec a
	cmp.b $B9
	bpl CODE_9E8E91
	lda.w #$FF01
	sta.b $A5
	lda.w #$0000
	sec
	sbc.b $B9
	dec a
	cmp.b $B1
	bpl CODE_9E8E91
	stz.b $A5
	lda.w #$FF01
	sta.b $A9
	lda.b $AD
	dec a
	cmp.b $B5
	bpl CODE_9E8E91
	lda.w #$00FF
	sta.b $A9
	lda.w #$0000
	sec
	sbc.b $B5
	dec a
	cmp.b $AD
	bpl CODE_9E8E91
CODE_9E8E8A:
	rtl
