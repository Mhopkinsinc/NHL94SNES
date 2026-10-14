; Unidentified routine.
CODE_9EB52F:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	stx.b xsave
	ldx.w #$0000
CODE_9EB540:
	lda.b a1,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EB540
	ldx.b xsave
	jsl.l GetPeriodTimeRemaining
	lda.b [a0]
	xba
	and.w #$00FF
	asl a
	sta.b d1
	tax
	stx.b a3
	stz.b d0
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w pfteam,x
	beq CODE_9EB582
	lda.w #$8000
	sta.b d0
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w $19BE
	clc
	adc.w #$0014
	bmi CODE_9EB582
	sta.w $19BE
CODE_9EB582:
	ldy.b a2
	lda.w $174A,y
	inc a
	sta.w $174A,y
	lda.w $174E,y
	clc
	adc.b d2
	sta.w $174E,y
	lda.w pnum,x
	and.w #$00FF
	ora.b d0
	sta.w TempPlOffset
	lda.w pnum,x
	sta.b d0
	lda.b a2
	beq CODE_9EB5AB
	lda.w #$001A
CODE_9EB5AB:
	phx
	clc
	adc.b d0
	tax
	sep #$20
	lda.w $198A,x
	rep #$20
	and.w #$00FF
	clc
	adc.b d2
	sep #$20
	sta.w $198A,x
	rep #$20
	plx
	lda.w $163C
	cmp.w #$0041
	bcs CODE_9EB5FD
	asl a
	asl a
	tay
	jsl.l GetPeriodTimeRemaining
	lda.b d0
	sta.w $163E,y
	iny
	iny
	lda.w TempPlOffset
	cmp.w #$0080
	bmi CODE_9EB5E6
	ora.w #$0080
CODE_9EB5E6:
	sep #$20
	sta.w $163E,y
	rep #$20
	iny
	lda.b [a0]
	and.w #$00FF
	sep #$20
	sta.w $163E,y
	rep #$20
	inc.w $163C
CODE_9EB5FD:
	lda.w TempPlOffset
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB60B
	ora.w #$FF00
CODE_9EB60B:
	asl a
	sta.b d0
	phx
	ldx.w #$003C
	lda.b d2
	and.w #$00FF
	jsl.l CODE_808F4C
	ora.w #$2000
	sta.b d2
	plx
	lda.b a2
	beq CODE_9EB628
	lda.w #$0034
CODE_9EB628:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bmi CODE_9EB636
	and.w #$1000
	tsb.b d2
CODE_9EB636:
	lda.b d2
	sta.w tmpdst,y
	lda.w #$1000
	trb.b d2
	lda.b $8B
	pha
	lda.b a0
	pha
	lda.b a2
	beq CODE_9EB64D
	lda.w #$001A
CODE_9EB64D:
	sta.b a0
	lda.w #$0018
	sta.b d1
CODE_9EB654:
	ldy.b a0
	inc.b a0
	lda.w tmboxlist,y
	bit.w #$0080
	bne CODE_9EB664
	dec.b d1
	bpl CODE_9EB654
CODE_9EB664:
	lda.b d0
	ora.w #$FF00
	sta.w tmboxlist,y
	pla
	sta.b a0
	pla
	sta.b $8B
	lda.w #$000D
	sta.b d0
	jsl.l assreplace
	stx.b xsave
	ldx.w #$000E
CODE_9EB680:
	pla
	sta.b a1,x
	dex
	dex
	bpl CODE_9EB680
	ldx.b xsave
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
	ldx.b a3
	jsl.l SetPA
	jsl.l ShowInjuryBox
	bra CODE_9EB6CC
