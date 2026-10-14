; Unidentified routine.
CODE_9D9A5C:
	phb
	phk
	plb
	lda.w #$007E
	sta.b $12
	lda.w #$47F4
	sta.b $10
	jsr.w CODE_9D9B9B
	lsr a
	eor.w #$FFFF
	inc a
	clc
	adc.w #$0024
	sta.b $14
	lsr a
	lsr a
	lsr a
	sta.b $16
	clc
	adc.w printx
	sta.w printx
	lda.b $16
	asl a
	asl a
	asl a
	eor.w #$FFFF
	inc a
	clc
	adc.b $14
	sta.b $14
	ldy.w #$0000
.1:
	lda.b $14
	asl a
	sta.b $02
	lda.b [$0C],y
	and.w #$00FF
	bne .t2
	lda.w #$FFFF
	sta.b $08
	jmp.w .4

.t2:
	cmp.w #$0020
	beq .2
	cmp.w #$002E
	bne .t1
	lda.w #$001A
	bra .2

.t1:
	and.w #$00DF
	sec
	sbc.w #$0041
.2:
	phy
	sta.b $08
	cmp.w #$0020
	bne .t1x
	lda.w #$0005
	bra .3

.t1x:
	lda.b $08
	asl a
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	sta.b $06
	lda.l $7E3466
	jsr.w CODE_9D9BFC
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w CODE_9D9BFC
	ldx.b $08
	lda.l DATA8_9C9623,x
	and.w #$00FF
.3:
	clc
	adc.b $14
	cmp.w #$0008
	bcc .5
.4:
	jsl.l $001D59
	inc.w printx
	lda.b $06
	sta.b $04
	lda.l $7E3466
	inc a
	inc a
	sta.l $7E3466
	lda.b $08
	bmi .7
	cmp.w #$0020
	beq .5
	lda.b $14
	eor.w #$0007
	sta.b $16
	asl a
	sta.b $0A
	lda.l $7E3466
	jsr.w CODE_9D9C2A
	lda.b $08
	asl a
	clc
	adc.w #$0036
	tax
	lda.l DATA8_9ADF59+6,x
	asl a
	asl a
	asl a
	asl a
	asl a
	sta.b $04
	lda.l $7E3466
	inc a
	jsr.w CODE_9D9C2A
.5:
	ldx.b $08
	cmp.w #$0020
	bne .t1xx
	lda.w #$0005
	bra .6

.t1xx:
	lda.l DATA8_9C9623,x
	and.w #$00FF
.6:
	clc
	adc.b $14
	and.w #$0007
	sta.b $14
	ply
	iny
	jmp.w .1
.7:
	plb
	rtl
