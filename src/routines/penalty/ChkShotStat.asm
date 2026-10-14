; If a shot was taken, add it to the shooting team's shots
ChkShotStat:
	lda.w #$1000
	trb.w sflags
	bne .t1
	jmp.w .7

.t1:
	lda.w gmclock
	beq .t3
	jmp.w .7

.t3:
	lda.b a1
	pha
	lda.b $8F
	pha
	lda.b a2
	pha
	lda.b $93
	pha
	lda.b a3
	pha
	lda.b $97
	pha
	lda.b d0
	pha
	lda.b $A7
	pha
	phx
	ldx.w $0D29
	stx.b a3
	stz.b a2
	lda.w #$0002
	sta.b a1
	txa
	cmp.w #$000C
	bmi .1
	lda.w #$0002
	sta.b a2
	stz.b a1
.1:
	ldy.w #$177A
	lda.w pfteam,x
	beq .2
	iny
	iny
.2:
	lda.w $0000,y
	inc a
	sta.w $0000,y
	ldy.b a2
	bne .t2
	lda.w tmap
	sec
	sbc.w $17A8
	beq .6
	bmi .t1x
	lda.w $175A
	inc a
	sta.w $175A
	bra .6

.t1x:
	lda.w $175E
	inc a
	sta.w $175E
	bra .6

.t2:
	lda.w $17A8
	sec
	sbc.w tmap
	beq .6
	bmi .t1xx
	lda.w $175C
	inc a
	sta.w $175C
	bra .6

.t1xx:
	lda.w $1760
	inc a
	sta.w $1760
.6:
	lda.w gsp
	asl a
	asl a
	tax
	lda.b a2
	beq .1x
	inx
	inx
.1x:
	lda.w $176A,x
	inc a
	sta.w $176A,x
	ldx.b a3
	lda.w pnum,x
	sta.b d0
	lda.b a2
	beq .2x
	lda.w #$001A
.2x:
	clc
	adc.b d0
	ldx.b a2
	cmp.w tmgoalie,x
	beq .3
	tax
	sep #$20
	inc.w $1956,x
	rep #$20
.3:
	ldx.b a1
	lda.w tmgoalie,x
	sta.b d0
	bmi .5
	lda.b a1
	beq .4
	lda.w #$001A
.4:
	clc
	adc.b d0
	tax
	sep #$20
	inc.w $1956,x
	rep #$20
.5:
	plx
	pla
	sta.b $A7
	pla
	sta.b d0
	pla
	sta.b $97
	pla
	sta.b a3
	pla
	sta.b $93
	pla
	sta.b a2
	pla
	sta.b $8F
	pla
	sta.b a1
	lda.w $19BE
	clc
	adc.w #$000A
	bmi .7
	sta.w $19BE
.7:
	rtl
