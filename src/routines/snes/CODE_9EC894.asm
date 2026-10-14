; Unidentified routine.
CODE_9EC894:
	phx
	lda.w #$0020
	sta.b $24
	lda.b [a1]
	dec a
	dec a
	sta.b $22
	inc.b a1
	inc.b a1
	lda.b $8F
	sta.b $0E
	lda.b a1
	sta.b $0C
	lda.w #$007F
	sta.b $12
	lda.w #$2780
	sta.b $10
	ldy.w printy
	ldx.w printx
	lda.l $7E35B6
	clc
	adc.l printfontset
	ora.w printa
	jsl.l .t1
	plx
	rtl

.t1:
	sta.b $26
	stx.b $1C
	tya
	asl a
	ldx.b $24
	jsl.l Mul16U
	lda.b $1C
	asl a
	clc
	adc.b $08
	adc.b $10
	sta.b $10
	ldy.w #$0000
.loop:
	lda.b [$0C]
	and.w #$00FF
	beq CODE_9EC902
	asl a
	tax
	lda.l DATA8_9ACDB0+6,x
	clc
	adc.b $26
	sta.b [$10],y
	iny
	iny
	inc.b $0C
	dec.b $22
	bne .loop
CODE_9EC901:
	rtl
