; Play one period of a playoff game with random goals
SetScore:
	phx
	ldx.b a0
	lda.l $7E3568,x
	cmp.w #$0004
	bcc .t3
	jmp.w .3

.t3:
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b a0
	pha
	lda.b $8B
	pha
	lda.b a1
	pha
	lda.b $8F
	pha
	ldx.b a0
	lda.l $7E3568,x
	cmp.w #$0003
	bne .t2
	lda.w #$0005
	sta.l $7E3568,x
	lda.l $7E3578,x
	sec
	sbc.l $7E3588,x
	bit.w #$8000
	beq .1
	eor.w #$FFFF
	inc a
.1:
	cmp.w #$0002
	bcs .2
	lda.w gsp
	cmp.w #$0004
	bne .t1
	lda.l $7E3578,x
	cmp.l $7E3588,x
	bne .2
	inc a
	sta.l $7E3578,x
	bra .2

.t1:
	lda.w #$0003
	sta.l $7E3568,x
	lda.l $7E3598,x
	ora.w #$0002
	sta.l $7E3598,x
	bra .2

.t2:
	lda.l $7E3568,x
	inc a
	sta.l $7E3568,x
	lda.l $7E3528,x
	sta.b d0
	lda.l $7E3538,x
	sta.b d1
	jsl.l .4
	ldx.b a0
	lda.l $7E3578,x
	clc
	adc.b d0
	sta.l $7E3578,x
	lda.l $7E3538,x
	sta.b d0
	lda.l $7E3528,x
	sta.b d1
	jsl.l .4
	ldx.b a0
	lda.l $7E3588,x
	clc
	adc.b d0
	sta.l $7E3588,x
.2:
	pla
	sta.b $8F
	pla
	sta.b a1
	pla
	sta.b $8B
	pla
	sta.b a0
	pla
	sta.b $AB
	pla
	sta.b d1
	pla
	sta.b $A7
	pla
	sta.b d0
.3:
	plx
	rtl
.4:
	asl.b d0
	asl.b d0
	lda.w #$009C
	sta.b $8F
	lda.w #TeamList
	sta.b a1
	ldy.b d0
	lda.b [a1],y
	sta.b a1
	ldy.w #$0008
	adc.b [a1],y
	sta.b a1
	lda.b [a1]
	and.w #$0070
	lsr a
	adc.w #$A038
	sta.b a1
	lda.w #$009F
	sta.b $8F
	lda.b [a1]
	sta.w $0CF9
	ldy.w #$0002
	lda.b [a1],y
	sta.w $0CFB
	ldy.w #$0004
	lda.b [a1],y
	sta.w $0CFD
	ldy.w #$0006
	lda.b [a1],y
	sta.w $0CFF
	asl.b d1
	asl.b d1
	lda.w #$009C
	sta.b $8F
	lda.w #TeamList
	sta.b a1
	ldy.b d1
	lda.b [a1],y
	sta.b a1
	ldy.w #$0008
	adc.b [a1],y
	sta.b a1
	lda.b [a1]
	and.w #$0007
	asl a
	asl a
	asl a
	adc.w #$A038
	sta.b a1
org $9FA001
	lda.w #$009F
	sta.b $8F
	lda.b [a1]
	adc.w $0CF9
	sta.w $0CF9
	ldy.w #$0002
	lda.b [a1],y
	adc.w $0CFB
	sta.w $0CFB
	ldy.w #$0004
	lda.b [a1],y
	adc.w $0CFD
	sta.w $0CFD
	ldy.w #$0006
	lda.b [a1],y
	adc.w $0CFF
	sta.w $0CFF
	lda.w #$0004
	sta.b d0
	jml.l WeightedRandomSelect
