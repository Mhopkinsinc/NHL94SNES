; Print with the big font (2 by 2 tiles per character)
printbig:
	phx
	lda.b d0
	pha
	lda.b $A7
	pha
	lda.b d1
	pha
	lda.b $AB
	pha
	lda.b d2
	pha
	lda.b $AF
	pha
	ldy.w #$0002
CODE_9ECE2B:
	tya
	cmp.b [a1]
	bne .t3
	jmp.w CODE_9ECF91

.t3:
	lda.w printy
	asl a
	asl a
	asl a
	asl a
	asl a
	adc.w printx
	asl a
	sta.b d1
	lda.b [a1],y
	bit.w #$0080
	beq .t1
	jmp.w CODE_9ECF40

.t1:
	and.w #$00FF
	bne .t2
	jmp.w .5

.t2:
	cmp.w #$0061
	bcc .1x
	cmp.w #$007B
	bcs .1x
	adc.w #$FFE0
.1x:
	sec
	sbc.w #$0020
	bne .t1x
	jmp.w .6

.t1x:
	stz.b d2
	inc.b d2
	tax
	lda.l DATA8_80D6FE,x
	and.w #$00FF
	bit.w #$0080
	beq .1xx
	ora.w #$FF00
.1xx:
	cmp.w #$0000
	bpl .2
	eor.w #$FFFF
	inc a
	stz.b d2
.2:
	asl a
	sta.b d0
	tax
	lda.l DATA8_9ABD3D+6,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l textmap,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs .3
	sta.w textdirtylo
.3:
	clc
	adc.w #$0021
	cmp.w textdirtyhi
	bcc .4
	sta.w textdirtyhi
.4:
	ldx.b d0
	lda.l $9ABDDB,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l $7E3834,x
	lda.b d2
	beq .1
	ldx.b d0
	lda.l DATA8_9ABD3D+8,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l $7E37F6,x
	ldx.b d0
	lda.l $9ABDDD,x
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l $7E3836,x
	inc.w printx
.1:
	inc.w printx
.5:
	iny
	jmp.w CODE_9ECE2B
.6:
	lda.l $9ABD6F
	clc
	adc.l $7E35AE
	adc.l printfontset
	ora.w $0D0D
	ldx.b d1
	sta.l textmap,x
	sta.l $7E3834,x
	txa
	lsr a
	cmp.w textdirtylo
	bcs .1xxx
	sta.w textdirtylo
.1xxx:
	clc
	adc.w #$0020
	cmp.w textdirtyhi
	bcc .1
	sta.w textdirtyhi
	bra .1
