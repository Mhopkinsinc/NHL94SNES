; Unidentified routine.
CODE_80B863:
	sep #$30
	lda.w $3032,x
	and.b #$7F
	sta.b $16
	clc
	adc.b $00
	tay
	lda.w $3032,y
	bmi .1
	clc
	adc.b $16
	sta.b $16
.1:
	lda.w $3093,x
	bmi .t1
	tay
	lda.w $3032,y
	bmi .t1
	clc
	adc.b $16
	sta.w $3032,y
	tya
	adc.w $3032,y
	tax
	tya
	sta.w $3093,x
	rep #$30
	plb
	ply
	plx
	rtl

.t1:
	lda.b $16
	sta.w $3032,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $3093,y
	rep #$30
	plb
	ply
	plx
	rtl

.t2:
	phb
	pea.w $7E7E
	plb
	plb
	stz.b $14
	lda.w $07B8
.loop:
	tax
	lda.w $2F40,x
	and.w #$00FF
	beq .t1x
	cmp.w #$0010
	bcs .1x
	clc
	adc.b $14
	sta.b $14
.1x:
	and.w #$003F
	sta.b $2A
	txa
	clc
	adc.b $2A
	bra .loop

.t1x:
	plb
	lda.b $14
	rtl
