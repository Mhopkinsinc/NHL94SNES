; Unidentified routine.
CODE_9EF29E:
	lda.w $1760
	inc a
	sta.w $1760
CODE_9EF2A5:
	lda.w gsp
	asl a
	asl a
	tax
	lda.b $91
	beq CODE_9EF2B1
	inx
	inx
CODE_9EF2B1:
	lda.w $176A,x
	inc a
	sta.w $176A,x
	ldx.b $95
	lda.w pnum,x
	sta.b $A5
	lda.b $91
	beq CODE_9EF2C6
	lda.w #$001A
CODE_9EF2C6:
	clc
	adc.b $A5
	ldx.b $91
	cmp.w tmgoalie,x
	beq CODE_9EF2D8
	tax
	sep #$20
	inc.w $1956,x
	rep #$20
CODE_9EF2D8:
	ldx.b $8D
	lda.w tmgoalie,x
	sta.b $A5
	bmi CODE_9EF2F3
	lda.b $8D
	beq CODE_9EF2E8
	lda.w #$001A
CODE_9EF2E8:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $1956,x
	rep #$20
CODE_9EF2F3:
	plx
	pla
	sta.b $A7
	pla
	sta.b $A5
	pla
	sta.b $97
	pla
	sta.b $95
	pla
	sta.b $93
	pla
	sta.b $91
	pla
	sta.b $8F
	pla
	sta.b $8D
	lda.w $19BE
	clc
	adc.w #$000A
	bmi CODE_9EF318
	sta.w $19BE
CODE_9EF318:
	rtl
