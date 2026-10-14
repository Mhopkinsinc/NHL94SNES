; Unidentified routine.
CODE_9EF406:
	inc a
	inc a
	jsl.l CODE_9C9FD5
	lda.l $7E35E0
	clc
	adc.w #$01F4
	sta.l $7E35E0
	lda.w #$0078
	sta.b $81
	lda.w #$0003
	jsl.l CODE_9C9B5F
CODE_9EF424:
	lda.b $83
	sta.w $0D2B
	jsl.l CODE_9EC791
	stz.w $1E8B
	stz.w $1E89
	phx
	lda.w gsp
	asl a
	asl a
	tax
	lda.w $19BE
	clc
	adc.w #$001E
	bmi CODE_9EF446
	sta.w $19BE
CODE_9EF446:
	lda.b $91
	beq CODE_9EF458
	inx
	inx
	lda.w $19BE
	clc
	adc.w #$FFCE
	bmi CODE_9EF458
	sta.w $19BE
CODE_9EF458:
	lda.w $177E,x
	inc a
	sta.w $177E,x
	plx
	lda.l $7E313A
	cmp.w #$0258
	bne CODE_9EF471
	sec
	sbc.w #$0006
	sta.l $7E313A
CODE_9EF471:
	lda.w #$007E
	sta.b $8B
	lda.w #$313C
	clc
	adc.l $7E313A
	sta.b $89
	lda.l $7E313A
	adc.w #$0006
	sta.l $7E313A
	jsl.l GetPeriodTimeRemaining
	lda.b $A5
	sta.b [$89]
	inc.b $89
	inc.b $89
	lda.w #$0002
	clc
	ldy.b $91
	adc.w tmap,y
	ldy.b $8D
	sec
	sbc.w tmap,y
	ldy.b $91
	beq CODE_9EF4AD
	ora.w #$0080
CODE_9EF4AD:
	sta.b [$89]
	inc.b $89
	lda.w tmtouch1,y
	sta.b $A5
	sta.b [$89]
	inc.b $89
	lda.w #$FFFF
	sta.b [$89]
	ldx.b $91
	lda.w tmgoalie,x
	cmp.b $A5
	beq CODE_9EF4DA
	lda.b $91
	beq CODE_9EF4CF
	lda.w #$001A
CODE_9EF4CF:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $18EE,x
	rep #$20
CODE_9EF4DA:
	ldy.b $91
	lda.w tmtouch2,y
	sta.b $A5
	bmi CODE_9EF51C
	sep #$20
	sta.b [$89]
	rep #$20
	lda.b $91
	beq CODE_9EF4F0
	lda.w #$001A
CODE_9EF4F0:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $1922,x
	rep #$20
	inc.b $89
	lda.w tmtouch3,y
	sta.b $A5
	bmi CODE_9EF51C
	sep #$20
	sta.b [$89]
	rep #$20
	lda.b $91
	beq CODE_9EF511
	lda.w #$001A
CODE_9EF511:
	clc
	adc.b $A5
	tax
	sep #$20
	inc.w $1922,x
	rep #$20
CODE_9EF51C:
	ldy.b $8D
	lda.w tmgoalie,y
	sta.b $A5
	bmi CODE_9EF533
	lda.b $8D
	beq CODE_9EF52C
	lda.w #$001A
CODE_9EF52C:
	clc
	adc.b $A5
	tax
	inc.w $18EE,x
CODE_9EF533:
	jsl.l CODE_9EB94C
	jsl.l CODE_9F9B36
	lda.w #$0008
	sta.b $A5
	jsl.l CODE_9EF5B8
	lda.b $91
	bne CODE_9EF556
	lda.w $1790
	sec
	sbc.w $178E
	bmi CODE_9EF556
	cmp.w #$0003
	bcs CODE_9EF556
CODE_9EF556:
	stz.w $0CDB
	stz.w puckvx
	stz.w puckvy
	ldy.w #$0006
	lda.w $0D71
	bpl CODE_9EF56A
	ldy.w #$FFFA
CODE_9EF56A:
	sty.w $0D71
	ldy.w #$0110
	lda.w pucky
	bpl CODE_9EF578
	ldy.w #$FEF0
CODE_9EF578:
	sty.w pucky
	lda.w #$0600
	sta.w $0E01
	stz.w $0DF9
	lda.w #$FFFF
	sta.w $0D19
	sta.w $0D1D
	sta.w $157F
	lda.w #$001A
	sta.b $A5
	jsl.l assreplace
	inx
	inx
	lda.w #$F644
	jsl.l CODE_9EA3F1
	ldy.b $91
	ldx.w tmsort,y
	stx.b $95
	lda.w #$000E
	sta.b $A5
	jsl.l CODE_9EB88A
	ldx.w #$001C
	stx.b $95
	rtl
