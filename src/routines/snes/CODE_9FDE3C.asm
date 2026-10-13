; Unidentified routine.
CODE_9FDE3C:
	stx.b $87
	ldx.w #$0000
CODE_9FDE41:
	lda.b $A5,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FDE41
	ldx.b $87
	lda.b $8D
	pha
	lda.b $8F
	pha
	lda.w #$2000
	sta.w $0D0D
	lda.b $A5
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	lsr a
	cmp.w #$0020
	bcc CODE_9FDE6A
	lda.w #$001F
CODE_9FDE6A:
	sta.b $A5
	ldy.w #$0002
	lda.w #$0006
	sta.w $0A2A
	lda.w #$0003
	sta.b $B1
CODE_9FDE7A:
	lda.w #$FFFF
	sta.b $AD
	lda.b $A5
	bmi CODE_9FDE8F
	sta.b $AD
	cmp.w #$0008
	bcc CODE_9FDE8F
	lda.w #$0007
	sta.b $AD
CODE_9FDE8F:
	lda.b $AD
	sec
	adc.b $A9
	and.w #$00FF
	bne CODE_9FDE9C
	lda.w #$0020
CODE_9FDE9C:
	sta.w $0A2A,y
	iny
	lda.b $A5
	sec
	sbc.w #$0008
	sta.b $A5
	dec.b $B1
	bpl CODE_9FDE7A
	lda.b $A9
	beq CODE_9FDEB6
	lda.w #$0C00
	tsb.w $0D0D
CODE_9FDEB6:
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	lda.w printx
	sec
	sbc.w #$000B
	sta.w printx
	lda.w #$4000
	tsb.w $0D0D
	lda.w #$0000
	sta.b $8F
	lda.w #$0A2A
	sta.b $8D
	sep #$20
	lda.w $0A2F
	ldy.w $0A2C
	sty.w $0A2F
	sta.w $0A2C
	rep #$30
	lda.w $0A2D
	xba
	sta.w $0A2D
	lda.w #$4000
	trb.w $0D0D
	pla
	sta.b $8F
	pla
	sta.b $8D
	stx.b $87
	ldx.w #$000E
CODE_9FDF02:
	pla
	sta.b $A5,x
	dex
	dex
	bpl CODE_9FDF02
	ldx.b $87
	rtl
