; Unidentified routine.
CODE_9FDE3C:
	stx.b xsave
	ldx.w #$0000
CODE_9FDE41:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9FDE41
	ldx.b xsave
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.w #$2000
	sta.w $0D0D
	lda.b d0
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
	sta.b d0
	ldy.w #$0002
	lda.w #$0006
	sta.w mesarea
	lda.w #$0003
	sta.b d3
CODE_9FDE7A:
	lda.w #$FFFF
	sta.b d2
	lda.b d0
	bmi CODE_9FDE8F
	sta.b d2
	cmp.w #$0008
	bcc CODE_9FDE8F
	lda.w #$0007
	sta.b d2
CODE_9FDE8F:
	lda.b d2
	sec
	adc.b d1
	and.w #$00FF
	bne CODE_9FDE9C
	lda.w #$0020
CODE_9FDE9C:
	sta.w mesarea,y
	iny
	lda.b d0
	sec
	sbc.w #$0008
	sta.b d0
	dec.b d3
	bpl CODE_9FDE7A
	lda.b d1
	beq CODE_9FDEB6
	lda.w #$0C00
	tsb.w $0D0D
CODE_9FDEB6:
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	lda.w printx
	sec
	sbc.w #$000B
	sta.w printx
	lda.w #$4000
	tsb.w $0D0D
	lda.w #$0000
	sta.b $8F
	lda.w #mesarea
	sta.b a1
	sep #$20
	lda.w $0A2F
	ldy.w mesarea+2
	sty.w $0A2F
	sta.w mesarea+2
	rep #$30
	lda.w $0A2D
	xba
	sta.w $0A2D
	lda.w #$4000
	trb.w $0D0D
	pla
	sta.b $8F
	pla
	sta.b a1
	stx.b xsave
	ldx.w #$000E
CODE_9FDF02:
	pla
	sta.b d0,x
	dex
	dex
	bpl CODE_9FDF02
	ldx.b xsave
	rtl
