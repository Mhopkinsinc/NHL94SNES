; Unidentified routine.
CODE_80B76C:
	xba
	and.w #$00FF
	asl a
	tax
CODE_80B772:		; free tile cache entry X and its VRAM
	sep #$20
	lda.b #$FF
	sta.w $2741,y
	rep #$20
CODE_80B77B:
	lda.w $2C40,x
	sta.b $00
	dec.w $07BA
	beq .1
	stx.b $02
	lda.w $07BA
	asl a
	cmp.b $02
	beq .1
	tay
	lda.w $2540,y
	sta.w $2540,x
	lda.w $2640,y
	sta.w $2640,x
	lda.w $2B40,y
	sta.w $2B40,x
	lda.w $2C40,y
	sta.w $2C40,x
	lda.w $2E40,y
	sta.w $2E40,x
	lda.w $2D40,y
	sta.w $2D40,x
	ldy.w $2B40,x
	txa
	lsr a
	sep #$20
	sta.w $2741,y
	rep #$20
.1:
	ldx.b $00
	bmi .t2
	jmp.w CODE_80B863

.t2:
	sep #$30
	lda.w $2F40,x
	and.b #$40
	bne .2
	lda.w $2F40,x
	and.b #$3F
	sta.b $16
	clc
	adc.b $00
	tay
	and.b #$07
	beq .1x
	lda.w $2F40,y
	bmi .1x
	clc
	adc.b $16
	sta.b $16
.1x:
	txa
	and.b #$07
	beq .t1
	lda.w $2FB9,x
	bmi .t1
	tay
	lda.w $2F40,y
	bmi .t1
	clc
	adc.b $16
	sta.w $2F40,y
	tya
	adc.w $2F40,y
	tax
	tya
	sta.w $2FB9,x
	rep #$30
	plb
	ply
	plx
	rtl

.t1:
	lda.b $16
	sta.w $2F40,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $2FB9,y
	rep #$30
	plb
	ply
	plx
	rtl
.2:
	lda.w $2F40,x
	and.b #$40
	beq .t1x
	lda.b #$08
	sta.w $2F40,x
	txa
	clc
	adc.b #$08
	tax
	bra .2

.t1x:
	lda.w $2F40,x
	and.b #$3F
	sta.b $16
	txa
	clc
	adc.b $16
	tay
	and.b #$07
	beq .1xx
	lda.w $2F40,y
	bmi .1xx
	clc
	adc.b $16
	sta.b $16
.1xx:
	lda.b $16
	sta.w $2F40,x
	txa
	clc
	adc.b $16
	tay
	txa
	sta.w $2FB9,y
	rep #$30
	plb
	ply
	plx
	rtl
