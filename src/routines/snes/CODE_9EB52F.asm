; Unidentified routine.
CODE_9EB52F:
	lda.b $A5
	pha
	lda.b $A7
	pha
	lda.b $A9
	pha
	lda.b $AB
	pha
	stx.b $87
	ldx.w #$0000
CODE_9EB540:
	lda.b $8D,x
	pha
	inx
	inx
	cpx.w #$0010
	bne CODE_9EB540
	ldx.b $87
	jsl.l GetPeriodTimeRemaining
	lda.b [$89]
	xba
	and.w #$00FF
	asl a
	sta.b $A9
	tax
	stx.b $95
	stz.b $A5
	stz.b $91
	lda.w #$0002
	sta.b $8D
	lda.w pfteam,x
	beq CODE_9EB582
	lda.w #$8000
	sta.b $A5
	stz.b $8D
	lda.w #$0002
	sta.b $91
	lda.w $19BE
	clc
	adc.w #$0014
	bmi CODE_9EB582
	sta.w $19BE
CODE_9EB582:
	ldy.b $91
	lda.w $174A,y
	inc a
	sta.w $174A,y
	lda.w $174E,y
	clc
	adc.b $AD
	sta.w $174E,y
	lda.w pnum,x
	and.w #$00FF
	ora.b $A5
	sta.w $1636
	lda.w pnum,x
	sta.b $A5
	lda.b $91
	beq CODE_9EB5AB
	lda.w #$001A
CODE_9EB5AB:
	phx
	clc
	adc.b $A5
	tax
	sep #$20
	lda.w $198A,x
	rep #$20
	and.w #$00FF
	clc
	adc.b $AD
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
	lda.b $A5
	sta.w $163E,y
	iny
	iny
	lda.w $1636
	cmp.w #$0080
	bmi CODE_9EB5E6
	ora.w #$0080
CODE_9EB5E6:
	sep #$20
	sta.w $163E,y
	rep #$20
	iny
	lda.b [$89]
	and.w #$00FF
	sep #$20
	sta.w $163E,y
	rep #$20
	inc.w $163C
CODE_9EB5FD:
	lda.w $1636
	and.w #$00FF
	bit.w #$0080
	beq CODE_9EB60B
	ora.w #$FF00
CODE_9EB60B:
	asl a
	sta.b $A5
	phx
	ldx.w #$003C
	lda.b $AD
	and.w #$00FF
	jsl.l CODE_808F4C
	ora.w #$2000
	sta.b $AD
	plx
	lda.b $91
	beq CODE_9EB628
	lda.w #$0034
CODE_9EB628:
	clc
	adc.b $A5
	tay
	lda.w tmpdst,y
	bmi CODE_9EB636
	and.w #$1000
	tsb.b $AD
CODE_9EB636:
	lda.b $AD
	sta.w tmpdst,y
	lda.w #$1000
	trb.b $AD
	lda.b $8B
	pha
	lda.b $89
	pha
	lda.b $91
	beq CODE_9EB64D
	lda.w #$001A
CODE_9EB64D:
	sta.b $89
	lda.w #$0018
	sta.b $A9
CODE_9EB654:
	ldy.b $89
	inc.b $89
	lda.w tmboxlist,y
	bit.w #$0080
	bne CODE_9EB664
	dec.b $A9
	bpl CODE_9EB654
CODE_9EB664:
	lda.b $A5
	ora.w #$FF00
	sta.w tmboxlist,y
	pla
	sta.b $89
	pla
	sta.b $8B
	lda.w #$000D
	sta.b $A5
	jsl.l assreplace
	stx.b $87
	ldx.w #$000E
CODE_9EB680:
	pla
	sta.b $8D,x
	dex
	dex
	bpl CODE_9EB680
	ldx.b $87
	pla
	sta.b $AB
	pla
	sta.b $A9
	pla
	sta.b $A7
	pla
	sta.b $A5
	ldx.b $95
	jsl.l SetPA
	jsl.l ShowInjuryBox
	bra CODE_9EB6CC
