; Unidentified routine.
CODE_9FDE13:
	jsl.l CODE_9FE089
	lda.w printy
	sec
	sbc.w #$000F
	bmi .1
	lda.w #$0001
	trb.w sflags3
.1:
	inc.b d1
	lda.l $7E35D0
	sta.b d2
	lda.l $7E3120
	bne .2
	jsl.l eraser
.2:
	jml.l CODE_9F9B36

.t1:
	stx.b xsave
	ldx.w #$0000
.loop:
	lda.b d0,x
	pha
	inx
	inx
	cpx.w #$0010
	bne .loop
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
	bcc .1x
	lda.w #$001F
.1x:
	sta.b d0
	ldy.w #$0002
	lda.w #$0006
	sta.w mesarea
	lda.w #$0003
	sta.b d3
.loop2:
	lda.w #$FFFF
	sta.b d2
	lda.b d0
	bmi .2x
	sta.b d2
	cmp.w #$0008
	bcc .2x
	lda.w #$0007
	sta.b d2
.2x:
	lda.b d2
	sec
	adc.b d1
	and.w #$00FF
	bne .3
	lda.w #$0020
.3:
	sta.w mesarea,y
	iny
	lda.b d0
	sec
	sbc.w #$0008
	sta.b d0
	dec.b d3
	bpl .loop2
	lda.b d1
	beq .4
	lda.w #$0C00
	tsb.w $0D0D
.4:
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
.loop3:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loop3
	ldx.b xsave
	rtl
