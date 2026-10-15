; Compare stat column $1DF9 of the players at order slots x and y ($1DFB); $1DC9 is not 0 when they swap
ComparePlayerStats:
	phx
	phy
	lda.b d0
	pha
	sep #$20
	lda.w statsorder,y
	rep #$20
	and.w #$00FF
	tay
	sep #$20
	lda.w statsorder,x
	rep #$20
	and.w #$00FF
	tax
	stx.w statstemp
	lda.b a2
	beq .2
.1:
	lda.w #$001A
.2:
	clc
	adc.w statstemp
	tax
	sty.w statstemp
	lda.b a2
	beq .4
.3:
	lda.w #$001A
.4:
	clc
	adc.w statstemp
	tay
	lda.w statcolumn
	cmp.w #$0001
	beq .t3
.5:
	cmp.w #$0002
	beq .t4
	cmp.w #$0003
	beq .t5
	cmp.w #$0004
	bne .t2
	jmp.w .t6

.t2:
	cmp.w #$0005
	bne .t1
	jmp.w .t1x

.t1:
	jmp.w .6

.t3:
	sep #$20
	lda.w tmgoals,y
	cmp.w tmgoals,x
	rep #$20
	beq .6
.1x:
	bpl .7
	jmp.w .6

.t4:
	sep #$20
	lda.w passists,y
	cmp.w passists,x
	rep #$20
	beq .6
	bpl .7
	bra .6

.t5:
	sep #$20
	lda.w tmgoals,y
	rep #$20
	and.w #$00FF
	sta.b d0
	sep #$20
	lda.w passists,y
	rep #$20
	and.w #$00FF
	clc
	adc.b d0
	sta.b d0
	sep #$20
	lda.w tmgoals,x
	rep #$20
	and.w #$00FF
	sta.w statstemp
	sep #$20
	lda.w passists,x
	rep #$20
	and.w #$00FF
	clc
	adc.w statstemp
	sta.w statstemp
	lda.b d0
	cmp.w statstemp
	beq .6
	bmi .6
	bra .7

.t6:
	sep #$20
	lda.w pshots,y
	cmp.w pshots,x
	rep #$20
	beq .6
	bpl .7
	bra .6

.t1x:
	sep #$20
	lda.w ppenmin,y
	cmp.w ppenmin,x
	rep #$20
	beq .6
	bpl .7
.6:
	lda.w #$0000
	sta.w statstemp
	bra .8
.7:
	lda.w #$0001
	sta.w statstemp
.8:
	pla
	sta.b d0
	ply
	plx
	rtl
