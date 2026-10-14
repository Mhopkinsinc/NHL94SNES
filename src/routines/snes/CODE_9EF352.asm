; Unidentified routine.
CODE_9EF352:
	lda.w $1E91
	beq CODE_9EF34B
CODE_9EF357:
	jsl.l CODE_9EF213
	jsl.l freezewindow
	lda.w #$001E
	sta.w $0CA9
	stz.b a2
	lda.w #$0002
	sta.b a1
	lda.w pucky
	bpl .1
	stz.b a1
	lda.w #$0002
	sta.b a2
.1:
	lda.w gmode
	bit.w #$0002
	beq .2
	lda.b a1
	sta.b a2
	eor.w #$0002
	sta.b a1
.2:
	ldy.b a2
	lda.w $178E,y
	inc a
	sta.w $178E,y
	lda.w tmap
	sec
	sbc.w $17A8
	beq CODE_9EF3AE
	bmi .t1
	ldy.b a2
	beq CODE_9EF3AE
	bra CODE_9EF3A7

.t1:
	ldy.b a2
	bne CODE_9EF3AE
CODE_9EF3A7:
	lda.w $1762,y
	inc a
	sta.w $1762,y
CODE_9EF3AE:
	lda.w $1E9B
	bne .t1
	lda.w $1E8B
	beq CODE_9EF3CC
	ldy.b a2
	lda.w $17C6,y
	inc a
	sta.w $17C6,y
	bra CODE_9EF3CC

.t1:
	ldy.b a2
	lda.w $17CE,y
	inc a
	sta.w $17CE,y
CODE_9EF3CC:
	lda.w $1E89
	beq .1
	ldy.b a2
	lda.w $17DA,y
	inc a
	sta.w $17DA,y
.1:
	jsl.l MusicStop
	lda.w #$0002
	jsl.l CODE_9C9A7F
	stz.w $0C23
	ldy.b a2
	beq .t1
	lda.w #$0004
	jsl.l CODE_9C9FD5
	lda.l $7E35E0
	sec
	sbc.w #$0300
	bpl .2
	lda.w #$0000
.2:
	sta.l $7E35E0
	bra CODE_9EF424

.t1:
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
	bmi .1
	sta.w $19BE
.1:
	lda.b a2
	beq .2
	inx
	inx
	lda.w $19BE
	clc
	adc.w #$FFCE
	bmi .2
	sta.w $19BE
.2:
	lda.w $177E,x
	inc a
	sta.w $177E,x
	plx
	lda.l $7E313A
	cmp.w #$0258
	bne .3
	sec
	sbc.w #$0006
	sta.l $7E313A
.3:
	lda.w #$007E
	sta.b $8B
	lda.w #$313C
	clc
	adc.l $7E313A
	sta.b a0
	lda.l $7E313A
	adc.w #$0006
	sta.l $7E313A
	jsl.l GetPeriodTimeRemaining
	lda.b d0
	sta.b [a0]
	inc.b a0
	inc.b a0
	lda.w #$0002
	clc
	ldy.b a2
	adc.w tmap,y
	ldy.b a1
	sec
	sbc.w tmap,y
	ldy.b a2
	beq .4
	ora.w #$0080
.4:
	sta.b [a0]
	inc.b a0
	lda.w tmtouch1,y
	sta.b d0
	sta.b [a0]
	inc.b a0
	lda.w #$FFFF
	sta.b [a0]
	ldx.b a2
	lda.w tmgoalie,x
	cmp.b d0
	beq .6
	lda.b a2
	beq .5
	lda.w #$001A
.5:
	clc
	adc.b d0
	tax
	sep #$20
	inc.w $18EE,x
	rep #$20
.6:
	ldy.b a2
	lda.w tmtouch2,y
	sta.b d0
	bmi .9
	sep #$20
	sta.b [a0]
	rep #$20
	lda.b a2
	beq .7
	lda.w #$001A
.7:
	clc
	adc.b d0
	tax
	sep #$20
	inc.w $1922,x
	rep #$20
	inc.b a0
	lda.w tmtouch3,y
	sta.b d0
	bmi .9
	sep #$20
	sta.b [a0]
	rep #$20
	lda.b a2
	beq .8
	lda.w #$001A
.8:
	clc
	adc.b d0
	tax
	sep #$20
	inc.w $1922,x
	rep #$20
.9:
	ldy.b a1
	lda.w tmgoalie,y
	sta.b d0
	bmi .11
	lda.b a1
	beq .10
	lda.w #$001A
.10:
	clc
	adc.b d0
	tax
	inc.w $18EE,x
.11:
	jsl.l CODE_9EB94C
	jsl.l CODE_9F9B36
	lda.w #$0008
	sta.b d0
	jsl.l .t1
	lda.b a2
	bne .12
	lda.w $1790
	sec
	sbc.w $178E
	bmi .12
	cmp.w #$0003
	bcs .12
.12:
	stz.w $0CDB
	stz.w puckvx
	stz.w puckvy
	ldy.w #$0006
	lda.w $0D71
	bpl .13
	ldy.w #$FFFA
.13:
	sty.w $0D71
	ldy.w #$0110
	lda.w pucky
	bpl .14
	ldy.w #$FEF0
.14:
	sty.w pucky
	lda.w #$0600
	sta.w $0E01
	stz.w $0DF9
	lda.w #$FFFF
	sta.w $0D19
	sta.w $0D1D
	sta.w $157F
	lda.w #$001A
	sta.b d0
	jsl.l assreplace
	inx
	inx
	lda.w #$F644
	jsl.l CODE_9EA3F1
	ldy.b a2
	ldx.w tmsort,y
	stx.b a3
	lda.w #$000E
	sta.b d0
	jsl.l CODE_9EB88A
	ldx.w #$001C
	stx.b a3
	rtl

.t1:
	phx
	ldy.b a2
	lda.w tmsort,y
	tax
	lda.w #$0005
	sta.b d3
.loop:
	lda.w position,x
	bmi .1x
	beq .1x
	stz.w $1563,x
	jsl.l assinsert
.1x:
	inx
	inx
	dec.b d3
	bpl .loop
	plx
CODE_9EF5D9:
	rtl
