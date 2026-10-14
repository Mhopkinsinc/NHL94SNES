; Unidentified routine.
CODE_9EB4C1:
	lda.b [a0]
	inc.b a0
	inc.b a0
	cmp.w #$0000
	bne CODE_9EB4C1
	dec.b a0
	dec.b a0
	dec.b a0
	dec.b a0
	lda.b [a0]
	pha
	and.w #$7FFF
	sta.b [a0]
	pla
	bmi .t4
	lda.b [a0]
	xba
	and.w #$00FF
	asl a
	sta.b d1
	tay
	lda.w position,y
	bmi .t1
	jmp.w CODE_9EB6CC

.t1:
	lda.w #$0000
	sta.b [a0]
	jmp.w CODE_9EB6CC

.t4:
	lda.b [a0]
	and.w #$00FF
	sta.b d0
	tay
	lda.w #$0080
	sta.b $8F
	lda.w #DATA8_80D3EB
	sta.b a1
	lda.b [a1],y
	clc
	adc.b a1
	sta.b a1
	cmp.w #$D4AD
	bne .t2
	jmp.w .t3

.t2:
	cmp.w #$D434
	bne .1
	jsl.l CODE_9C9BAB
.1:
	lda.b [a1]
	and.w #$00FF
	sta.b d2
	bne .t1x
	jmp.w CODE_9EB6A5

.t1x:
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
.loop:
	lda.b a1,x
	pha
	inx
	inx
	cpx.w #$0010
	bne .loop
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
	beq .1x
	lda.w #$8000
	sta.b d0
	stz.b a1
	lda.w #$0002
	sta.b a2
	lda.w $19BE
	clc
	adc.w #$0014
	bmi .1x
	sta.w $19BE
.1x:
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
	beq .2
	lda.w #$001A
.2:
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
	bcs .4
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
	bmi .3
	ora.w #$0080
.3:
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
.4:
	lda.w TempPlOffset
	and.w #$00FF
	bit.w #$0080
	beq .5
	ora.w #$FF00
.5:
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
	beq .6
	lda.w #$0034
.6:
	clc
	adc.b d0
	tay
	lda.w tmpdst,y
	bmi .7
	and.w #$1000
	tsb.b d2
.7:
	lda.b d2
	sta.w tmpdst,y
	lda.w #$1000
	trb.b d2
	lda.b $8B
	pha
	lda.b a0
	pha
	lda.b a2
	beq .8
	lda.w #$001A
.8:
	sta.b a0
	lda.w #$0018
	sta.b d1
.loop2:
	ldy.b a0
	inc.b a0
	lda.w tmboxlist,y
	bit.w #$0080
	bne .9
	dec.b d1
	bpl .loop2
.9:
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
.loop3:
	pla
	sta.b a1,x
	dex
	dex
	bpl .loop3
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
	jsl.l USBoard
	bra CODE_9EB6CC

.t3:
	jsl.l CODE_9EC72D
CODE_9EB6A5:
	lda.w #$0000
	sta.b [a0]
	lda.w sfhormode
	beq .t1
	jmp.w CODE_9EB4A1

.t1:
	jsl.l SetPA
	bra CODE_9EB6CC
