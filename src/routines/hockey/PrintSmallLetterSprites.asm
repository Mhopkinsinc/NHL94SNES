; Draw string [a1] with the small letter sprites at X / Y
PrintSmallLetterSprites:
	stx.w letterx
	sty.w lettery
	ldy.w #$0002
.1:
	tya
	cmp.b [a1]
	bne .t1
	jmp.w .4

.t1:
	lda.b [a1],y
	and.w #$00FF
	cmp.w #$0020
	bne .t4
	lda.w #$0003
	bra .2

.t4:
	cmp.w #$002E
	bne .t1x
	lda.w #$0024
	bra .t3

.t1x:
	cmp.w #$0030
	bcc .t2
	cmp.w #$003A
	bcs .t2
	sec
	sbc.w #$0030
	clc
	adc.w #$001A
	bra .t3

.t2:
	cmp.w #$0061
	bcc .t1xx
	cmp.w #$007B
	bcs .t1xx
	sec
	sbc.w #$0061
	bra .t3

.t1xx:
	cmp.w #$0041
	bcc .3
	cmp.w #$005B
	bcs .3
	sec
	sbc.w #$0041
	bra .t3

.t3:
	tax
	phx
	phy
	lda.w #SmallLetterSprites>>16
	sta.b $12
	lda.w #SmallLetterSprites
	sta.b $10
	stx.b $00
	lda.w #$2000
	ldx.w letterx
	ldy.w lettery
	jsl.l DrawSprite
	ply
	plx
	lda.w #$0004
	cpx.w #$0024
	bne .2
	lda.w #$0002
.2:
	clc
	adc.w letterx
	sta.w letterx
.3:
	iny
	jmp.w .1
.4:
	rtl
