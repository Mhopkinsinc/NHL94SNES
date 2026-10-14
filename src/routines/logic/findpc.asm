; When and where the puck will cross each goal line
findpc:
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
	lda.w #$0008
	sta.b $00
	ldy.w puckc
	bmi .9
	lda.w position,x
	beq .t1
	lda.w $19D4,x
	bmi .t1
	lda.w pfalock,x
	bne .t1
	lda.w $0B3D,x
	cmp.w #$0064
	bcs .t1
	jmp.w .10

.t1:
	lda.w $19D4,y
	bmi .1
	tay
	lda.w $19F6,y
	cmp.w $19F6,x
	beq .9
.1:
	ldy.w #$0000
	lda.w pfgoal,x
	bne .2
	ldy.w #$0004
.2:
	sty.b $00
.9:
	lda.w #$0006
	sta.b d1
	ldy.b d4
	lda.w #$FFFF
	sta.b d2
	ldx.w #$0000
	lda.w $1C84,y
	cmp.w #$0001
	beq .1x
	ldx.w #$000C
.1x:
	lda.w position,x
	bmi .8
	beq .8
	lda.w pflags,x
	bit.w #$1000
	bne .8
	lda.w SPA,x
	cmp.w #SPAturnl
	bcc .2x
	cmp.w #$EBE3
	bcc .4
.2x:
	cmp.w #DATA8_9DF196
	bcc .3
	cmp.w #$F343
	bcc .4
.3:
	lda.w pflags,x
	and.w #$1000
	ora.w pfalock,x
	bne .8
.4:
	lda.w $19D4,x
	bmi .5
	cmp.b d4
	bne .8
.5:
	stz.b $14
	lda.w puckc
	bmi .7
	lda.b $00
	cmp.w #$0008
	beq .7
	eor.w $0B5D,x
	cmp.w #$0004
	bcc .6
	eor.w #$FFFF
	adc.w #$0008
.6:
	cmp.w #$0000
	beq .7
	dec a
	asl a
	asl a
	asl a
	asl a
	asl a
	clc
	adc.b $14
	sta.b $14
.7:
	lda.w $0B1D,x
	clc
	adc.b $14
	bcs .8
	cmp.b d2
	bcs .8
	stx.b d3
	sta.b d2
.8:
	inx
	inx
	dec.b d1
	bne .1x
	ldx.b a3
	lda.b d2
	cmp.w #$FFFF
	beq .12
	ldy.b d4
	lda.b d3
	cmp.w $19EC,y
	bne .11
.10:
	lda.w pfalock,x
	bne .12
	lda.b d4
	pha
	lda.b $B7
	pha
	lda.b d5
	pha
	lda.b $BB
	pha
	lda.b d6
	pha
	lda.b $BF
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	jsl.l Sweepcheck
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $BF
	pla
	sta.b d6
	pla
	sta.b $BB
	pla
	sta.b d5
	pla
	sta.b $B7
	pla
	sta.b d4
	bra .12
.11:
	sta.b d0
	jsl.l AssignPadPlayer
.12:
	stx.b xsave
	ldx.w #$000E
.loopx:
	pla
	sta.b d0,x
	dex
	dex
	bpl .loopx
	ldx.b xsave
	rtl
